return {
  black = 0xff16161d,
  white = 0xffdcd7ba,
  red = 0xffc34043,
  green = 0xff76946a,
  blue = 0xff7e9cd8,
  yellow = 0xffdca561,
  orange = 0xffffa066,
  magenta = 0xff957fb8,
  grey = 0xff727169,
  transparent = 0x00000000,

  bar = {
    bg = 0xf01f1f28,
    border = 0xff54546d,
  },
  popup = {
    bg = 0xc0223249,
    border = 0xff54546d
  },
  bg1 = 0xff1f1f28,
  bg2 = 0xff2a2a37,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}
