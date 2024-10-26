import java.util.Arrays;

// Imprimir Matriz
public class Problema3_Java {

    public static void imprimirMat(int[][] mat) {
        System.out.println("---Matriz---");
        int filas = mat.length;
        for (int i = 0; i < filas; i++) {
            System.out.println(Arrays.toString(mat[i]));
        }
    }

    public static int[][] crearMat(int filas, int columnas) {
        int[][] matriz = new int[filas][columnas];
        return matriz;
    }

    public static int[][] multiplicarMatrices(int[][] mat1, int[][] mat2) {
        // Verifica si se puede multiplicar
        if (mat1[0].length != mat2.length) {
            System.out.println("Multiplicación no es posible");
            System.exit(0);
        }

        // Cantidad de filas y columnas de las matrices
        int mat1Filas = mat1.length;
        int mat1Columnas = mat1[0].length;

        int mat2Filas = mat2.length;
        int mat2Columnas = mat2[0].length;

        int[][] resultado = crearMat(mat1Filas, mat2Columnas);
        // imprimirMat(resultado);

        // Realizar la multiplicación
        for (int i = 0; i < mat1Filas; i++) {
            for (int j = 0; j < mat2Columnas; j++) {
                for (int k = 0; k < mat2Filas; k++) {
                    resultado[i][j] += mat1[i][k] * mat2[k][j];
                }
            }
        }

        return resultado;
    }

    // Programa principal
    public static void main(String[] args) {
        int[][] matriz1 = {
            {1, 2, 3},
            {4, 5, 6}
        };

        int[][] matriz2 = {
            {7, 8},
            {9, 10},
            {11, 12},
            {11, 12}
        };

        imprimirMat(matriz1);
        imprimirMat(matriz2);

        int[][] resultado = multiplicarMatrices(matriz1, matriz2);

        System.out.println("Resultado final");
        imprimirMat(resultado);
    }
}
