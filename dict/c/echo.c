/*
  echo.
*/

#include <stdio.h>

int main(int argc, char *argv[])
{
  while (--argc)
    printf((argc > 1)? "%s ": "%s", *++argv);
  return 0;
}
