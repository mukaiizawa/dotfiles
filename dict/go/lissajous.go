package main

import (
  "image"
  "image/color"
  "image/gif"
  "math"
  "os"
  "strconv"
)

// x = sin(a*t + phase)
// y = sin(b*t)

var palette = []color.Color{color.Black, color.RGBA{0x0, 0xff, 0x0, 0xff}}

const (
  BLACK = 0
  GREEN = 1
  r = 100
  delay = 6
)

func lissajous(a float64, b float64) {
  anim := gif.GIF{}
  for phase := 0.0; phase < 2*math.Pi; phase += math.Pi/64 {
    rect := image.Rect(0, 0, 2*r, 2*r)
    img := image.NewPaletted(rect, palette)
    for t := 0.0; t < 2*math.Pi; t += 0.0001 {
      x := math.Sin(a*t)
      y := math.Sin(b*t + phase)
      img.SetColorIndex(r+int(x*r), r+int(y*r), GREEN)
    }
    for i := 0; i <= 2*r; i++ {
      img.SetColorIndex(r, i, GREEN)
      img.SetColorIndex(i, r, GREEN)
    }
    anim.Delay = append(anim.Delay, delay)
    anim.Image = append(anim.Image, img)
  }
  gif.EncodeAll(os.Stdout, &anim)
}

func main() {
  a := 1.0
  b := 1.0
  argc := len(os.Args[1:])
  if 1 <= argc && argc <= 2{
    a, _ = strconv.ParseFloat(os.Args[1], 64)
  }
  if argc == 2 {
    b, _ = strconv.ParseFloat(os.Args[2], 64)
  }
  lissajous(a, b)
}
