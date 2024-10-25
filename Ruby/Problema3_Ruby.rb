# Imprimir Matriz
def imprimir_mat(mat)
  puts "--- Matriz ---"
  filas = mat.length
  for i in 0...filas
    p mat[i]
  end
end

# Crear una matriz de ceros
def crear_mat(filas, columnas)
  matriz = []
  for i in 0...filas
    matriz << [0] * columnas
  end
  matriz
end

# Multiplicar dos matrices
def multiplicar_matrices(mat1, mat2)
  # Verifica si se pueden multiplicar
  if mat1[0].length != mat2.length
    puts 'Multiplicación no es posible'
    exit
  end

  # Cantidad de filas y columnas de las matrices
  mat1_filas = mat1.length
  mat1_columnas = mat1[0].length

  mat2_filas = mat2.length
  mat2_columnas = mat2[0].length

  # Crear la matriz resultado con ceros
  resultado = crear_mat(mat1_filas, mat2_columnas)

  # Realizar la multiplicación
  for i in 0...mat1_filas
    for j in 0...mat2_columnas
      for k in 0...mat2_filas
        resultado[i][j] += mat1[i][k] * mat2[k][j]
      end
    end
  end

  resultado
end

# Programa principal
if __FILE__ == $0
  matriz1 = [
    [1, 2, 3],
    [4, 5, 6]
  ]

  matriz2 = [
    [7, 8],
    [9, 10],
    [11, 12]
  ]

  imprimir_mat(matriz1)
  imprimir_mat(matriz2)

  resultado = multiplicar_matrices(matriz1, matriz2)

  puts 'Resultado final'
  imprimir_mat(resultado)
end
