using System;
using System.Collections.Generic;

// Clase para representar los registros
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

class Program
{
    static List<Alumno> CargarDatos()
    {
        List<Alumno> lista = new List<Alumno>();

        lista.Add(new Alumno("Diego", 21, 100));
        lista.Add(new Alumno("Daniela", 19, 90));
        lista.Add(new Alumno("Fiorella", 20, 88));
        lista.Add(new Alumno("Ricardo", 22, 66));
        lista.Add(new Alumno("Lucas", 21, 99));
        lista.Add(new Alumno("Matias", 18, 45));
        lista.Add(new Alumno("Andrea", 20, 78));
        lista.Add(new Alumno("Maria", 24, 97));

        return lista;
    }

    static void ImprimirLista(List<Alumno> lista)
    {
        foreach (Alumno alumno in lista)
        {
            alumno.Imprimir();
        }
    }

    static List<Alumno> QuickSortCalificacion(List<Alumno> lista)
    {
        // Caso base
        if (lista.Count <= 1)
        {
            return lista;
        }

        // Seleccion de la mediana de 3
        Alumno a = lista[0];
        Alumno b = lista[lista.Count / 2];
        Alumno c = lista[lista.Count - 1];

        Alumno mediana;
        if ((a.Calificacion > b.Calificacion && a.Calificacion < c.Calificacion) || (a.Calificacion < b.Calificacion && a.Calificacion > c.Calificacion))
        {
            mediana = a;
        } else if ((b.Calificacion > a.Calificacion && b.Calificacion < c.Calificacion) || (b.Calificacion < a.Calificacion && b.Calificacion > c.Calificacion))
        {
            mediana = b;
        } else {
            mediana = c;
        }

        List<Alumno> listaMenores = new List<Alumno>();
        List<Alumno> listaMayores = new List<Alumno>();

        // Cargar listas con los elementos mayores y menores que la mediana
        foreach (Alumno elemento in lista)
        {
            if (elemento.Calificacion < mediana.Calificacion)
            {
                listaMenores.Add(elemento);
            }
            else if (elemento.Calificacion > mediana.Calificacion)
            {
                listaMayores.Add(elemento);
            }
        }

        listaMenores = QuickSortCalificacion(listaMenores);
        listaMayores = QuickSortCalificacion(listaMayores);

        List<Alumno> listaFinal = new List<Alumno>(listaMenores);
        listaFinal.Add(mediana);
        listaFinal.AddRange(listaMayores);

        return listaFinal;
    }

    // Método principal
    static void Main(string[] args)
    {
        Console.WriteLine("Antes de ordenar");
        List<Alumno> lista = CargarDatos();
        ImprimirLista(lista);

        lista = QuickSortCalificacion(lista);

        Console.WriteLine("Después de ordenar");
        ImprimirLista(lista);
    }
}
