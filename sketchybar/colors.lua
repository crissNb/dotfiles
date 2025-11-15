return {
  black = 0xff1c1c1c,
  white = 0xffd0d0d0,
  red = 0xffaf005f,
  green = 0xff5faf00,
  blue = 0xff5fafd7,
  yellow = 0xffffaf00,
  orange = 0xffd7875f,
  magenta = 0xffff5faf,
  grey = 0xff808080,
  transparent = 0x00000000,

  bar = {
    bg = 0xf01c1c1c,
    border = 0xff585858,
  },
  popup = {
    bg = 0xc01c1c1c,
    border = 0xff585858
  },
  bg1 = 0xff1c1c1c,
  bg2 = 0xff808080,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}
