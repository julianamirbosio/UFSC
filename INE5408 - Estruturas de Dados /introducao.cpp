#include <iostream>

using namespace std;

int main() {

    // processo de tipagem (interpreta o espaço de memória)

    bool verifica;
    char caractere; // char de byte
    int a;          // inteiro de 4 bytes
    short int b;    // inteiro de 4 bytes
    long int c;     // inteiro de 4 bytes
    unsigned int d; // inteiro sem sinal de 4 bytes
    float e;        // numero real de 4 bytes
    double f;       // numero real de 8 bytes
    string g;
    
    // atribuições
    caractere = 'Z';
    a = 77;
    string = "UFSC";
    verifica = true;

    // std::cout << "Hello, Wold!"
    cout << "olá, mundo!" << endl; 
    cout << "carcater =" << caractere << endl;
    cout << "a =" << a << endl;
    cout << "tamanho de um inteiro = " << sizeof(int) << endl; 
    
    a++ // a += 1

    /*
        and -> &&
        or -> ||
    */

    if (include) {
        float notas[8]; // alocação estática de vetor

        float *notas_2sem; 
        notas_2sem = new float[8]; // alocação dinâmica de vetor

        // estrutura while(i<8)
        for (int i=0; i < 8; i++) {
            notas[i] = 0.0;
            cout << notas[i] << ' ' << notas_2sem[i] << endl;

        }
        cout << endl;

        // notas é automaticamente desalocada pelo compilador neste ponto
        delete [] notas_2sem; // a cada 'new' um 'delete'
    }

    // IF, ELSE (elsif* aninhado)
    if (g[0] == 'U' && a < 0) {
        cout << "entrou na condição\n";
    } else if  (g[1] == 'F' && a >= 0 && a < 100) {
        cout << "entrou na segunda condição\n";
    } else {
        cout << "entrou na terceira condição\n";
    }

    // WHILE
    int i = 0;
    while (i < 10){
        cout << i << ' ';
        i++;
    }
    cout << endl;

    // DO WHILE
    do{
        cout << i << ' ';
        i--;
    } while (i >= 0);
    cout << endl;

    // FOR (2 aninhados)
    int j;
    for (i=0,j=5 ; i < 10 && j >= 0 ; i++,j--) {
        cout << i << ' ' << endl;
    }
    cout << endl;

    // SWITCH CASE
    char op = '1';
    switch(op) {
        case '1';
            cout << "opção 1\n";
            cout << "-------\n";
            break;
        case '2';
            cout << "opção 2\n";
            cout << "-------\n";
            break;
        default; 
            cout << "nenhuma anterior\n";
    }

    // STRUCT - class

    return 0; 
}

 /*
    x = x - 1;
    z = x+ y;
    y = y + 1;

    z = --x + y + y++;
 */
