# Se utiliza una clase para representar los registros
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
    Alumno.new("Matias", 18, 45),
    Alumno.new("Ricardo", 22, 66),
    Alumno.new("Andrea", 20, 78),
    Alumno.new("Fiorella", 20, 88),
    Alumno.new("Daniela", 19, 90),
    Alumno.new("Maria", 24, 97),
    Alumno.new("Lucas", 21, 99),
    Alumno.new("Diego", 21, 100)
    ]
end

# Para imprimir la lista
def imprimir_lista(lista)
    lista.each do |alumno|
        alumno.imprimir
    end
end

# Realiza la búsqueda binaria teniendo en cuenta la calificación
def busqueda_binaria_calificacion(lista, calificacion)
    inicio = 0
    fin = lista.size - 1

    while inicio <= fin
        medio = (inicio + fin) / 2

        # Comprueba si el objetivo está en el medio
        if lista[medio].calificacion == calificacion
            return medio  # Devuelve el índice del objetivo

        # Si el objetivo es mayor que el elemento medio, ajusta la búsqueda a la mitad derecha
        elsif lista[medio].calificacion < calificacion
            inicio = medio + 1

        # Si el objetivo es menor que el elemento medio, ajusta la búsqueda a la mitad izquierda
        else
            fin = medio - 1
        end
    end

    return -1  # Si no se encuentra el objetivo devuelve -1
end

    # Programa principal
if __FILE__ == $0
    puts 'Lista'
    lista = cargar_datos

    imprimir_lista(lista)

    objetivo = 66
    indice_objetivo = busqueda_binaria_calificacion(lista, objetivo)

    if indice_objetivo == -1
        puts 'No se encontró un alumno con esa calificación'
    else
        puts 'Alumno encontrado'
        lista[indice_objetivo].imprimir
    end
end
  