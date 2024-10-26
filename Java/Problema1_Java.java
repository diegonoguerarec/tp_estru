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
public class Problema1_Java {
    public static List<Alumno> cargarDatos() {
        List<Alumno> lista = new ArrayList<>();

        lista.add(new Alumno("Diego", 21, 100));
        lista.add(new Alumno("Daniela", 19, 90));
        lista.add(new Alumno("Fiorella", 20, 88));
        lista.add(new Alumno("Ricardo", 22, 66));
        lista.add(new Alumno("Lucas", 21, 99));
        lista.add(new Alumno("Matias", 18, 45));
        lista.add(new Alumno("Andrea", 20, 78));
        lista.add(new Alumno("Maria", 24, 97));

        return lista;
    }

    // Para imprimir la lista antes y despues de ordenar
    public static void imprimirLista(List<Alumno> lista) {
        for (Alumno a : lista) {
            a.imprimir();
        }
    }

    // Haremos una ordenacion por calificacion
    public static List<Alumno> quickSortCalificacion(List<Alumno> lista) {

        // Caso base, cuando una lista tiene 0 o 1 elementos, entonces esta ordenada
        if (lista.size() <= 1) {
            return lista;
        }

        // Cuando la lista tiene más de un elemento

        // Primero elegimos el elemento pivote usando el método de mediana de 3
        Alumno a = lista.get(0);  // Primer elemento
        Alumno b = lista.get(lista.size() / 2);  // Elemento del medio
        Alumno c = lista.get(lista.size() - 1);  // Último elemento

        // Hallar mediana
        Alumno mediana;
        if ((a.calificacion > b.calificacion && a.calificacion < c.calificacion) || (a.calificacion < b.calificacion && a.calificacion > c.calificacion)) {
            mediana = a;
        } else if ((b.calificacion > a.calificacion && b.calificacion < c.calificacion) || (b.calificacion < a.calificacion && b.calificacion > c.calificacion)) {
            mediana = b;
        } else {
            mediana = c;
        }

        List<Alumno> listaMenores = new ArrayList<>();
        List<Alumno> listaMayores = new ArrayList<>();

        // Cargar listas con los elementos mayores y menores que la mediana
        for (Alumno elemento : lista) {
            if (elemento.calificacion < mediana.calificacion) {
                listaMenores.add(elemento);
            } else if (elemento.calificacion > mediana.calificacion) {
                listaMayores.add(elemento);
            }
        }

        // Ordenacion recursiva de las listas
        listaMenores = quickSortCalificacion(listaMenores);
        listaMayores = quickSortCalificacion(listaMayores);

        // Lista final ordenada
        List<Alumno> listaFinal = new ArrayList<>(listaMenores);
        listaFinal.add(mediana);
        listaFinal.addAll(listaMayores);

        return listaFinal;
    }

    // Programa principal
    public static void main(String[] args) {
        System.out.println("Antes de ordenar");
        List<Alumno> lista = cargarDatos();

        imprimirLista(lista);

        lista = quickSortCalificacion(lista);

        System.out.println("Después de ordenar");
        imprimirLista(lista);
    }
}
