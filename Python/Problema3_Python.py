# Imprimir Matriz
def imprimir_mat(mat):
    print("---Matriz---")
    filas = len(mat)
    for i in range(filas):
        print(mat[i])

def crear_mat(filas, columnas):
    matriz = []
    for i in range(filas):
        matriz.append([0]*columnas)
    
    return matriz

def multiplicar_matrices(mat1, mat2):
    # Verifica si se puede multiplicar
    if len(mat1[0]) != len(mat2):
        print('Multiplicacion no es posible')
        exit()

    # Cantidad de filas y columnas de las matrices
    mat1_filas = len(mat1)
    mat1_columnas = len(mat1[0])

    mat2_filas = len(mat2)
    mat2_columnas = len(mat2[0])

    resultado = crear_mat(len(mat1), len(mat2[0]))
    # imprimir_mat(resultado)

    # Realizar la multiplicación
    for i in range(mat1_filas):
        for j in range(mat2_columnas):
            for k in range(mat2_filas):
                resultado[i][j] += mat1[i][k] * mat2[k][j]

    return resultado


## Programa principal
if __name__ == "__main__":
    
    matriz1 = [[1,2,3],
              [4,5,6],]
    
    matriz2 = [[7,8],
               [9,10],
               [11,12]]
    
    imprimir_mat(matriz1)
    imprimir_mat(matriz2)

    resultado = multiplicar_matrices(matriz1, matriz2)

    print('Resultado final')
    imprimir_mat(resultado)