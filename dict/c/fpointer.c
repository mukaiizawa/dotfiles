#include <stdio.h>

char *YYYY_MM_DD(int y, int m, int d, char *s)
{
  sprintf(s, "%d/%02d/%02d", y, m, d);
  return s;
}

char *YY_MM_DD(int y, int m, int d, char *s)
{
  sprintf(s, "%02d/%02d/%02d", y%100, m, d);
  return s; 
}

int main (int argc, char **argv)
{
  char s [0x100];
  char *(*dateToString) (int,int,int,char*);

  dateToString = &YYYY_MM_DD;
  printf ("%s\n", (*dateToString)(9999, 1, 1, s));

  dateToString = &YY_MM_DD;
  printf ("%s\n", (*dateToString)(9999, 1, 1, s));

  return 0;
}
