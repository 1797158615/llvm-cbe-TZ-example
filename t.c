#include <stdio.h>

__attribute__((__annotate__("TZ")))
int inc(int a, int b)
{
return a+b;
}

__attribute__((__annotate__("TZ"), __annotate__("memsize(4, 4)"), __annotate__("TAFUN")))
void inc_value(int* a, int* b)
{
*a = inc(*a, *b);
}

int main() {
int i = 42;
int j = 1;
inc_value(&i, &j);
printf("i+j=%d\n", i);
return 0; 
}
