A = [[4, 2, 3], [2, -4, -1], [-1, 1, 4]]
b = []

n = len(b)
for k in range(1,n):
    for i in range(k, n):
        soma = 0
        for t in range(1, k-1):
            soma = soma + L[i][t] + U[t][k]
        L[i][k] = A[i][k] - soma
    U[k][k] = 1
    for j in range(k+1, n):
        soma = soma + L[k][t] + U[t][j]
print(L)
print(U)


# Ly = b
y[1] = b[1] / A[1][1]
for i in range(2, n):
    soma = 0
    for j in range(1, i-1):
        soma = soma + A[i][j] * y[j]
    y[i] = (y[i] - soma) / A[i][i]
    
print(y)

# Retrosubstituição 
x[n] = y[n]
for i in range(n-1,-1,1):
    soma = 0
    for j in range (i+1, n):
        soma = soma + A[i][j]*x[j]
    x[i] = (y[i] - soma)
    
print(x)
