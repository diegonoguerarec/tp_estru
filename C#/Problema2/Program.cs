using System;
using System.Collections.Generic;

// Se utiliza una clase para representar los registros
class Alumno
{
    public string Nombre { get; set; }
    public int Edad { get; set; }
    public int Calificacion { get; set; }

    public Alumno(string nombre, int edad, int calificacion)
    {
        Nombre = nombre;
        Edad = edad;
        Calificacion = calificacion;
    }

    public void Imprimir()
    {
        Console.WriteLine("-----Alumno-----");
        Console.WriteLine("Nombre: " + Nombre);
        Console.WriteLine("Edad: " + Edad);
        Console.WriteLine("Calificacion: " + Calificacion);
        Console.WriteLine();
    }
}

// Programa principal
class Program
{
    // Para la carga de datos en la lista
    static List<Alumno> CargarDatos()
    {
        List<Alumno> lista = new List<Alumno>();

        // La lista ya está ordenada por calificaciones
        lista.Add(new Alumno("Matias", 18, 45));
        lista.Add(new Alumno("Ricardo", 22, 66));
        lista.Add(new Alumno("Andrea", 20, 78));
        lista.Add(new Alumno("Fiorella", 20, 88));
        lista.Add(new Alumno("Daniela", 19, 90));
        lista.Add(new Alumno("Maria", 24, 97));
        lista.Add(new Alumno("Lucas", 21, 99));
        lista.Add(new Alumno("Diego", 21, 100));

        return lista;
    }

    // Para imprimir la lista
    static void ImprimirLista(List<Alumno> lista)
    {
        foreach (Alumno a in lista)
        {
            a.Imprimir();
        }
    }

    // Realiza la búsqueda binaria teniendo en cuenta la calificación
    static int BusquedaBinariaCalificacion(List<Alumno> lista, int calificacion)
    {
        int inicio = 0;
        int fin = lista.Count - 1;

        while (inicio <= fin)
        {
            int medio = (fin + inicio) / 2;

            // Comprueba si el objetivo está en el medio
            if (lista[medio].Calificacion == calificacion)
            {
                return medio; // Devuelve el índice del objetivo
            }
            // Si el objetivo es mayor que el elemento medio, ajusta la búsqueda a la mitad derecha
            else if (lista[medio].Calificacion < calificacion)
            {
                inicio = medio + 1;
            }
            // Si el objetivo es menor que el elemento medio, ajusta la búsqueda a la mitad izquierda
            else
            {
                fin = medio - 1;
            }
        }

        return -1; // Si no se encuentra el objetivo devuelve -1
    }

    static void Main(string[] args)
    {
        Console.WriteLine("Lista");
        List<Alumno> lista = CargarDatos();
        ImprimirLista(lista);

        int objetivo = 999;
        int indiceObjetivo = BusquedaBinariaCalificacion(lista, objetivo);

        if (indiceObjetivo == -1)
        {
            Console.WriteLine("No se encontró un alumno con esa calificacion");
        } else {
            Console.WriteLine("Alumno encontrado");
            lista[indiceObjetivo].Imprimir();
        }
    }
}
