# sequencia de 5 termos para x=2
# valor aproximado = 7

def ex(x):
    soma = 1
    num = 1
    for i in range(1,5):
        num = num*x
        soma = soma + (num/fatorial(i))
    return soma
