package main

import (
  "bufio"
  "fmt"
  "os"
)

func countLines(f *os.File, counts map[string]int) {
  input := bufio.NewScanner(f)
  for input.Scan() {
    counts[input.Text()]++
  }
}

func main() {
  counts := make(map[string]int)
  files := os.Args[1:]
  if len(files) == 0 {
    countLines(os.Stdin, counts)
  } else {
    for _, arg := range files {
      f, err := os.Open(arg)
      if err != nil {
        fmt.Fprintf(os.Stderr, "dup: %v\n", err)
        continue
      }
      countLines(f, counts)
      f.Close()
    }
  }
  for line, n := range counts {
    if n > 1 {
      fmt.Printf("%d,%s\n", n, line)
    }
  }
}
