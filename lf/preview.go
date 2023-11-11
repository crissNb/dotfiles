#!/usr/bin/env gorun
//go:build ignore

/**
Why gorun?

Working with shell is a pain, especially considering different platforms.
You also need to think about escaping, quoting, etc.

[gorun](https://github.com/jackielii/gorun) lets you run go code as a script.
Just chmod +x file.go and you're good to go.

Instead of having a preinstalled binary like `pistol`, you can just copy this
script and modify as you wish.
**/

package main

import (
	"fmt"
	"io"
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"strconv"
	"strings"

	"golang.org/x/term"
)

type previewOpts struct {
	fp   string
	fi   os.FileInfo
	mime string
	ext  string

	width  int
	height int
	x      int
	y      int

	pagerRequired bool
}

func main() {
	if os.Getenv("DEBUG") != "" {
		f := try1(os.OpenFile("/tmp/lf-preview.log", os.O_WRONLY|os.O_CREATE|os.O_APPEND, 0644))
		defer f.Close()
		log.SetOutput(f)
		log.Println("hello")
		defer log.Println("bye")
	} else {
		log.SetOutput(io.Discard)
	}

	args := os.Args[1:]
	if len(args) == 0 {
		fmt.Printf("usage: %s <newname>\n", os.Args[0])
		os.Exit(2)
	}
	fp := args[0]
	fi := try1(os.Stat(fp))

	var w, h, x, y int
	var pagerRequired bool
	if len(args) >= 4 {
		w = try1(strconv.Atoi(args[1]))
		h = try1(strconv.Atoi(args[2]))
		x = try1(strconv.Atoi(args[3]))
		y = try1(strconv.Atoi(args[4]))
	} else {
		pagerRequired = true
		lfw := os.Getenv("lf_width")
		lfh := os.Getenv("lf_height")
		if lfw == "" || lfh == "" {
			w, h = try2(term.GetSize(int(os.Stdin.Fd())))
			// w = try1(strconv.Atoi(run("sh", "-c", "tput cols")))
			// h = try1(strconv.Atoi(run("sh", "-c", "tput lines")))
		} else {
			w = try1(strconv.Atoi(lfw))
			h = try1(strconv.Atoi(lfh))
		}
	}

	mime := runOutput(`file -b -L --mime-type "%s"`, fp)
	opts := previewOpts{
		fp:     fp,
		fi:     fi,
		mime:   mime,
		ext:    filepath.Ext(fp),
		width:  w,
		height: h,
		x:      x,
		y:      y,

		pagerRequired: pagerRequired,
	}

	ok := previewImage(opts)
	if ok {
		if !pagerRequired {
			os.Exit(1) // disables preview cache for lf
		}
	} else {
		previewText(opts)
	}
}

func previewImage(opts previewOpts) bool {
	// hide cursor if pager is required. At this point, we don't know if image
	// preview is possible. So we hide it, and defer the show call. Then when
	// needed, call show again.
	if opts.pagerRequired {
		run(`clear`)
		run(`tput civis`)       // hide cursor
		defer run(`tput cnorm`) // show cursor
	}

	cache := fmt.Sprintf("%s/.cache/lf/%s.jpg", os.Getenv("HOME"), fileStatHash(opts))
	var img string
	if _, err := os.Stat(cache); err == nil {
		img = cache
	} else {
		img = generatePreview(cache, opts)
	}
	if img == "" {
		// image preview not possible. Show cursor for text preview to control.
		run(`tput cnorm`)
		return false
	}

	if opts.pagerRequired {
		// enter raw mode and after kitty draws the image, wait for user input
		// for 'q' or 'i' or Ctrl-C
		// Here we need to swallow all the input, otherwise it'll be passed on
		// to lf, causing unexpected behavior.
		oldState := try1(term.MakeRaw(int(os.Stdin.Fd())))
		defer func() {
			b := make([]byte, 1)
		loop:
			for {
				try1(os.Stdin.Read(b))
				switch b[0] {
				// https://viewsourcecode.org/snaptoken/kilo/02.enteringRawMode.html#display-keypresses
				case 'q', 'i', 3, 10, 13, 27: // 3 is Ctrl-C, 27 is ESC, 10 is Enter, 13 is CR
					break loop
				}
			}
			term.Restore(int(os.Stdin.Fd()), oldState)
			clearKitty()
		}()
	}
	launchKitty(opts, img)
	return true
}

func clearKitty() {
	run(`kitty +kitten icat --clear --stdin no --transfer-mode memory </dev/null >/dev/tty`)
}

const cacheImageWidth = 1024

func generatePreview(cache string, opts previewOpts) string {
	log.Println("generating preview", opts)
	switch {
	case strings.HasPrefix(opts.mime, "image/svg"):
		runOutput(`rsvg-convert --keep-aspect-ratio --width %d "%s" -o "%s.png"`, cacheImageWidth, opts.fp, cache)
		os.Rename(cache+".png", cache)
		return cache
	case strings.HasPrefix(opts.mime, "image/"):
		orientation := runOutput(`identify -format '%%[EXIF:Orientation]\n' -- "%s"`, opts.fp)
		log.Printf("orientation: %q\n", orientation)
		if orientation != "" && orientation != "1" {
			runOutput(`convert -- "%s" -auto-orient "%s"`, opts.fp, cache)
			return cache
		}
		return opts.fp
	case opts.mime == "application/pdf":
		runOutput(`pdftoppm -f 1 -l 1 \
		  -scale-to-x %d              \
		  -scale-to-y -1              \
		  -singlefile                 \
		  -jpeg -tiffcompression jpeg \
		  -- "%s" "%s"`, cacheImageWidth, opts.fp, strings.TrimSuffix(cache, ".jpg"))
		return cache
	case opts.ext == ".drawio":
		drawio := "/Applications/draw.io.app/Contents/MacOS/draw.io"
		runOutput(`%s -x "%s" -o "%s" --width "%d"`, drawio, opts.fp, cache+".png", cacheImageWidth)
		os.Rename(cache+".png", cache)
		return cache
	default:
		return ""
	}
}

func fileStatHash(opts previewOpts) string {
	// TODO: use go's md5
	h := runOutput(`gstat --printf '%%n\0%%i\0%%F\0%%s\0%%W\0%%Y' -- "$(readlink -f "%s")" | md5 -q | awk '{print $1}'`, opts.fp)
	return strings.TrimSpace(string(h))

	// fi := opts.fi
	// info := fmt.Sprintf("%s%d%d", fi.Name(), fi.Size(), fi.ModTime().Unix())
	// return fmt.Sprintf("%x", md5.Sum([]byte(info)))
}

func launchKitty(opts previewOpts, imagePath string) {
	if os.Getenv("TMUX") != "" {
		opts.width--
		opts.height--
	}
	place := fmt.Sprintf("--place=%dx%d@%dx%d", opts.width, opts.height, opts.x, opts.y)
	clearKitty() // there could be a previous image
	run(`kitty +kitten icat --stdin=no --transfer-mode=memory %s "%s" </dev/null >/dev/tty`, place, imagePath)
}

func previewText(opts previewOpts) {
	// TODO: don't use pistol
	// 1. text use bat
	// 2. archives use ?
	// 3. docs use pandoc markdown
	s := fmt.Sprintf(`pistol -c ~/.config/pistol/pistol.conf "%s"`, opts.fp)
	if opts.pagerRequired {
		s += " | less -R"
	}
	run(s)
	// cmd := exec.Command("sh", "-c", s)
	// cmd.Stdin = os.Stdin
	// cmd.Stdout = os.Stdout
	// cmd.Stderr = os.Stderr
	// cmd.Run()
}

// run executes command in sh -c with output set to stdout which is the tty
func run(format string, args ...any) {
	execOpts{captureOutput: false}.exec(format, args...)
}

// runOutput executes command in sh -c and return output
func runOutput(format string, args ...any) string {
	return execOpts{captureOutput: true}.exec(format, args...)
}

type execOpts struct {
	captureOutput bool
	// captureInput  bool
}

func (e execOpts) exec(format string, args ...any) string {
	cmd := exec.Command("sh", "-c", fmt.Sprintf(format, args...))
	// cmd.Stdin = os.Stdin
	log.Printf("sh -c "+format+"\n", args...)
	if e.captureOutput {
		out := try1(cmd.Output())
		return strings.TrimSpace(string(out))
	}
	cmd.Stdout = os.Stdout
	try0(cmd.Run())
	return ""
}

func try0(err error) {
	if err != nil {
		log.Fatal(err)
	}
}

func try1[T any](v T, err error) T {
	if err != nil {
		log.Fatal(err)
	}
	return v
}

func try2[T any, V any](v T, v2 V, err error) (T, V) {
	if err != nil {
		log.Fatal(err)
	}
	return v, v2
}

// go.mod >>>
// module preview
// go 1.20
// require golang.org/x/term v0.6.0
// require golang.org/x/sys v0.6.0 // indirect
// <<< go.mod
// go.sum >>>
// golang.org/x/sys v0.6.0 h1:MVltZSvRTcU2ljQOhs94SXPftV6DCNnZViHeQps87pQ=
// golang.org/x/sys v0.6.0/go.mod h1:oPkhp1MJrh7nUepCBck5+mAzfO9JrbApNNgaTdGDITg=
// golang.org/x/term v0.6.0 h1:clScbb1cHjoCkyRbWwBEUZ5H/tIFu5TAXIqaZD0Gcjw=
// golang.org/x/term v0.6.0/go.mod h1:m6U89DPEgQRMq3DNkDClhWw02AUbt2daBVO4cn4Hv9U=
// <<< go.sum
