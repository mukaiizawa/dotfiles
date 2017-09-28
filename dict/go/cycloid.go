package main

import (
  "image"
  "image/color"
  "image/gif"
  "os"
  "math"
)

// x = r(t - sin(t))
// y = r(1 - cos(t))

var palette = []color.Color{color.Black, color.RGBA{0x0, 0xff, 0x0, 0xff}, color.RGBA{0xff, 0x00, 0x0, 0xff}}

const (
  BLACK = 0
  GREEN = 1
  RED = 2
  r = 50
  Δ = 0.0001
)

func cycloid() {
  anim := gif.GIF{}
  for t := 0.0; t < 4*math.Pi; t += 0.1 {
    rect := image.Rect(0, 0, 14*r, 4*r)
    img := image.NewPaletted(rect, palette)
    // circle
    for dθ := 0.0; dθ < 2*math.Pi; dθ += Δ {
      x := r*math.Cos(dθ) + r*t
      y := r*math.Sin(dθ) + r
      img.SetColorIndex(int(x), int(y), GREEN)
    }
    // circle axes
    for ds := 0.0; ds <= r; ds += 1.0 {
      x := -ds*math.Cos(t-math.Pi/2) + r*t
      y := ds*math.Sin(t-math.Pi/2) + r
      img.SetColorIndex(int(x), int(y), RED)
    }
    // trajectory
    for dt := 0.0; dt < t; dt += Δ {
      dx := r*(dt - math.Sin(dt))
      dy := r*(1 - math.Cos(dt))
      img.SetColorIndex(int(dx), int(dy), RED)
    }
    anim.Delay = append(anim.Delay, 8)
    anim.Image = append(anim.Image, img)
  }
  gif.EncodeAll(os.Stdout, &anim)
}

func main() {
  cycloid()
}
