/*
  word count.
*/

#include <stdio.h>

int main()
{
  int c;
  int cc, wc, lc;
  cc = wc = lc = 0;
  while ((c = getchar()) != EOF) {
    if (c == '\n') ++lc;
    ++cc;
  }
  return 0;
}
