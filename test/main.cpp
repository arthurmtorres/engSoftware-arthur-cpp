#include <iostream>
#include <cassert>
#include "../src/bib.hpp"

void test_calcularFatorial()
{
    assert(calcularFatorial(0) == 1);
    assert(calcularFatorial(1) == 1);
    assert(calcularFatorial(5) == 120);
    std::cout << "[OK] Testes de calcularFatorial passaram!" << std::endl;
}

int main()
{
    test_calcularFatorial();
    std::cout << "Todos os testes passaram com sucesso!" << std::endl;
    return 0;
}