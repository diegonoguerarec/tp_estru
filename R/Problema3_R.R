multiplicar_matrices <- function(mat1, mat2) {
  # Verifica si se puede multiplicar
  if (ncol(mat1) != nrow(mat2)) {
    cat("Multiplicación no es posible\n")
    return(NULL)
  }
  
  # Cantidad de filas y columnas de las matrices
  mat1_filas <- nrow(mat1)
  mat1_columnas <- ncol(mat1)
  
  mat2_filas <- nrow(mat2)
  mat2_columnas <- ncol(mat2)
  
  # Crear una matriz resultado inicializada a 0
  resultado <- matrix(0, nrow = mat1_filas, ncol = mat2_columnas)
  
  # Realizar la multiplicación
  for (i in 1:mat1_filas) {
    for (j in 1:mat2_columnas) {
      for (k in 1:mat2_filas) {
        resultado[i, j] <- resultado[i, j] + mat1[i, k] * mat2[k, j]
      }
    }
  }
  
  return(resultado)
}




# Vector de datos (para llenar las matrices)
datos <- 1:6

# Crear la primera matriz
matriz1 <- matrix(datos, nrow = 2, ncol = 3)

# Crear la segunda matriz
matriz2 <- matrix(datos, nrow = 3, ncol = 2)


print(matriz1)
print(matriz2)

resultado <- multiplicar_matrices(matriz1, matriz2)

print('Resultado final')
print(resultado)