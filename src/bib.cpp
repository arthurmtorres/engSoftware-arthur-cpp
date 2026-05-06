#include "bib.hpp"

int calcularFatorial(int n)
{
    if (n <= 1)
        return 1;
    return n * calcularFatorial(n - 1);
}

bool verificarPar(int n)
{
    return n % 2 == 0;
}