package main

import (
  "image"
  "image/color"
  "image/gif"
  "math"
  "os"
)

// x = r(cos(t))^3 = r*(3cos(t)+cos(3t))/4
// y = r(sin(t))^3 = r*(3sin(t)-sin(3t))/4

var palette = []color.Color{color.Black, color.RGBA{0x0, 0xff, 0x0, 0xff}, color.RGBA{0xff, 0x0, 0x0, 0xff}}

const (
  BLACK = 0
  GREEN = 1
  RED = 2
  r = 100
)

func astroid() {
  anim := gif.GIF{}
  for t := 0.0; t < 2*math.Pi; t += 0.02{
    rect := image.Rect(0, 0, 2*r, 2*r)
    img := image.NewPaletted(rect, palette)
    for ds := 0; ds <= 2*r; ds++ {
      // coordinate axes
      img.SetColorIndex(r, ds, GREEN)
      img.SetColorIndex(ds, r, GREEN)
    }
    for ds := 0.0; ds <= r/4; ds += 1.0 {
      // cardioid axes
      x := ds*math.Cos(-3*t) + (r*3/4)*math.Cos(t)
      y := ds*math.Sin(-3*t) + (r*3/4)*math.Sin(t)
      img.SetColorIndex(r+int(x), r+int(y), RED)
    }
    for dθ := 0.0; dθ <= 2*math.Pi; dθ += 0.001 {
      // small circle 
      x1 := (3*r/4)*math.Cos(t) + (r/4)*math.Sin(dθ)
      y1 := (3*r/4)*math.Sin(t) + (r/4)*math.Cos(dθ)
      img.SetColorIndex(r+int(x1), r+int(y1), GREEN)
      // large circle
      x2 := r * math.Cos(dθ)
      y2 := r * math.Sin(dθ)
      img.SetColorIndex(r+int(x2), r+int(y2), GREEN)
    }
    for dt := 0.0; dt <= t; dt += 0.001{
      // trajectory
      x := r * (3*math.Cos(dt) + math.Cos(3*dt)) / 4
      y := r * (3*math.Sin(dt) - math.Sin(3*dt)) / 4
      img.SetColorIndex(r+int(x), r+int(y), RED)
    }
    anim.Delay = append(anim.Delay, 6)
    anim.Image = append(anim.Image, img)
  }
  gif.EncodeAll(os.Stdout, &anim)
}

func main() {
  astroid()
}
