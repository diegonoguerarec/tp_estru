import java.util.ArrayList;
import java.util.List;

// Se utiliza una clase para representar los registros
class Alumno {
    String nombre;
    int edad;
    int calificacion;

    public Alumno(String nombre, int edad, int calificacion) {
        this.nombre = nombre;
        this.edad = edad;
        this.calificacion = calificacion;
    }

    public void imprimir() {
        System.out.println("-----Alumno-----");
        System.out.println("Nombre: " + this.nombre);
        System.out.println("Edad: " + this.edad);
        System.out.println("Calificacion: " + this.calificacion);
        System.out.println();
    }
}

// Para la carga de datos en la lista
public class Problema2_Java {
    public static List<Alumno> cargarDatos() {
        List<Alumno> lista = new ArrayList<>();

        // La lista ya está ordenada por calificaciones
        lista.add(new Alumno("Matias", 18, 45));
        lista.add(new Alumno("Ricardo", 22, 66));
        lista.add(new Alumno("Andrea", 20, 78));
        lista.add(new Alumno("Fiorella", 20, 88));
        lista.add(new Alumno("Daniela", 19, 90));
        lista.add(new Alumno("Maria", 24, 97));
        lista.add(new Alumno("Lucas", 21, 99));
        lista.add(new Alumno("Diego", 21, 100));

        return lista;
    }

    // Para imprimir la lista
    public static void imprimirLista(List<Alumno> lista) {
        for (Alumno a : lista) {
            a.imprimir();
        }
    }

    // Realiza la busqueda binaria teniendo en cuenta la calificacion
    public static int busquedaBinariaCalificacion(List<Alumno> lista, int calificacion) {

        int inicio = 0;
        int fin = lista.size() - 1;

        while (inicio <= fin) {
            int medio = (fin + inicio) / 2;

            // Comprueba si el objetivo está en el medio
            if (lista.get(medio).calificacion == calificacion) {
                return medio;  // Devuelve el índice del objetivo
            }

            // Si el objetivo es mayor que el elemento medio, ajusta la búsqueda a la mitad derecha
            else if (lista.get(medio).calificacion < calificacion) {
                inicio = medio + 1;
            }

            // Si el objetivo es menor que el elemento medio, ajusta la búsqueda a la mitad izquierda
            else {
                fin = medio - 1;
            }
        }

        return -1; // Si no se encuentra el objetivo devuelve -1
    }

    // Programa principal
    public static void main(String[] args) {
        System.out.println("Lista");
        List<Alumno> lista = cargarDatos();

        imprimirLista(lista);

        int objetivo = 90;
        int indiceObjetivo = busquedaBinariaCalificacion(lista, objetivo);

        if (indiceObjetivo == -1) {
            System.out.println("No se encontró un alumno con esa calificación");
        } else {
            System.out.println("Alumno encontrado");
            lista.get(indiceObjetivo).imprimir();
        }
    }
}
