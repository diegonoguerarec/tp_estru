using System;

class Program
{
    // Imprimir Matriz
    static void ImprimirMat(int[,] mat)
    {
        Console.WriteLine("---Matriz---");
        int filas = mat.GetLength(0);
        for (int i = 0; i < filas; i++)
        {
            for (int j = 0; j < mat.GetLength(1); j++)
            {
                Console.Write(mat[i, j] + " ");
            }
            Console.WriteLine();
        }
    }

    // Crear Matriz
    static int[,] CrearMat(int filas, int columnas)
    {
        int[,] matriz = new int[filas, columnas];
        return matriz;
    }

    // Multiplicar Matrices
    static int[,] MultiplicarMatrices(int[,] mat1, int[,] mat2)
    {
        // Verifica si se puede multiplicar
        if (mat1.GetLength(1) != mat2.GetLength(0))
        {
            Console.WriteLine("Multiplicación no es posible");
            Environment.Exit(0);
        }

        // Cantidad de filas y columnas de las matrices
        int mat1Filas = mat1.GetLength(0);
        int mat1Columnas = mat1.GetLength(1);
        
        int mat2Filas = mat2.GetLength(0);
        int mat2Columnas = mat2.GetLength(1);

        int[,] resultado = CrearMat(mat1Filas, mat2Columnas);

        // Realizar la multiplicación
        for (int i = 0; i < mat1Filas; i++)
        {
            for (int j = 0; j < mat2Columnas; j++)
            {
                for (int k = 0; k < mat2Filas; k++)
                {
                    resultado[i, j] += mat1[i, k] * mat2[k, j];
                }
            }
        }

        return resultado;
    }

    // Programa principal
    static void Main(string[] args)
    {
        int[,] matriz1 = {
            { 1, 2, 3 },
            { 4, 5, 6 }
        };

        int[,] matriz2 = {
            { 7, 8 },
            { 9, 10 },
            { 11, 12 }
        };

        ImprimirMat(matriz1);
        ImprimirMat(matriz2);

        int[,] resultado = MultiplicarMatrices(matriz1, matriz2);

        Console.WriteLine("Resultado final");
        ImprimirMat(resultado);
    }
}
