/*
  print from input to output.
*/

#include <stdio.h>

int main()
{
  int c;
  while ((c = getchar()) != EOF)
    putchar(c);
  return 0;
}
