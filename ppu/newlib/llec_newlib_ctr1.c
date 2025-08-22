#include "llec_crt.h"


extern int main (int argc, char *argv[]);


void _initialize(
    unsigned long long argc,
    unsigned long long argv
    )
{

    int main_return = main((int)argc, (char **)argv);
    (void *)main_return;
    
    return;

}
