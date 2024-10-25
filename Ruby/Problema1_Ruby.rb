# Clase para representar los registros
class Alumno
    attr_accessor :nombre, :edad, :calificacion
  
    def initialize(nombre, edad, calificacion)
      @nombre = nombre
      @edad = edad
      @calificacion = calificacion
    end
  
    def imprimir
      puts "----- Alumno -----"
      puts "Nombre: #{@nombre}"
      puts "Edad: #{@edad}"
      puts "Calificación: #{@calificacion}"
      puts
    end
end
  
# Método para cargar los datos en una lista
def cargar_datos
    [
      Alumno.new("Diego", 21, 100),
      Alumno.new("Daniela", 19, 90),
      Alumno.new("Fiorella", 20, 88),
      Alumno.new("Ricardo", 22, 66),
      Alumno.new("Lucas", 21, 99),
      Alumno.new("Matias", 18, 45),
      Alumno.new("Andrea", 20, 78),
      Alumno.new("Maria", 24, 97)
    ]
end
  
# Método para imprimir la lista de alumnos
def imprimir_lista(lista)
    lista.each(&:imprimir)
end
  
# QuickSort para ordenar por calificación
def quick_sort_calificacion(lista)

    # Caso base: lista de 0 o 1 elemento
    if lista.size <= 1
        return lista
    end
    
    # Elegimos el pivote usando el método de mediana de 3
    a = lista[0]           # Primer elemento
    b = lista[lista.size / 2] # Elemento del medio
    c = lista[-1]          # Último elemento

    # Hallar la mediana
    if (a.calificacion > b.calificacion && a.calificacion < c.calificacion) || (a.calificacion < b.calificacion && a.calificacion > c.calificacion)
        mediana = a
    elsif (b.calificacion > a.calificacion && b.calificacion < c.calificacion) || (b.calificacion < a.calificacion && b.calificacion > c.calificacion)
        mediana = b
    else
        mediana = c
    end

    lista_menores = []
    lista_mayores = []

    # Cargar listas con los elementos mayores y menores que la mediana
    lista.each do |elemento|
        if elemento.calificacion < mediana.calificacion
            lista_menores << elemento
        elsif elemento.calificacion > mediana.calificacion
            lista_mayores << elemento
        end
    end

    # Ordenar recursivamente las listas menores y mayores
    lista_menores_ordenada = quick_sort_calificacion(lista_menores)
    lista_mayores_ordenada = quick_sort_calificacion(lista_mayores)

    # Combinar las listas ordenadas y el pivote en una lista final
    lista_final = lista_menores_ordenada + [mediana] + lista_mayores_ordenada

    return lista_final
end

# Programa principal
if __FILE__ == $0
puts 'Antes de ordenar'
lista = cargar_datos
imprimir_lista(lista)

lista = quick_sort_calificacion(lista)

puts 'Después de ordenar'
imprimir_lista(lista)
end
  