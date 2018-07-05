#include <sys/time.h>

int main(int ac, char** av)
{
    struct timeval v;
    gettimeofday(&v, 0);
}