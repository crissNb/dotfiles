#!/usr/bin/env gorun
//go:build ignore

package main

import (
	"fmt"
	"log"
	"os"
	"os/exec"
	"strings"
)

func main() {
	sh(`kitty +kitten icat --clear --stdin no --transfer-mode memory < /dev/null > /dev/tty`)
}

func sh(format string, args ...any) string {
	cmd := exec.Command("sh", "-c", fmt.Sprintf(format, args...))
	cmd.Stdin = os.Stdin
	out, err := cmd.Output()
	if err != nil {
		log.Printf("sh:\n"+format+"\n", args...)
		log.Fatal(err)
	}
	return strings.TrimSpace(string(out))
}
