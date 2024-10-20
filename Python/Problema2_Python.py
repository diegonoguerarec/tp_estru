# Se utiliza una clase para representar los registros
class Alumno:
    def __init__(self, nombre, edad, calificacion):
        self.nombre = nombre
        self.edad = edad
        self.calificacion = calificacion

    def imprimir(self):
        print("-----Alumno-----")
        print("Nombre: ",self.nombre)
        print("Edad: ", self.edad)
        print("calificacion: ", self.calificacion)
        print()

# Para la carga de datos en la lista
def cargar_datos():
    lista = []

    # La lista ya esta ordanada por calificaciones
    
    lista.append(Alumno("Matias",18,45))
    lista.append(Alumno("Ricardo",22,66))
    lista.append(Alumno("Andrea",20,78))
    lista.append(Alumno("Fiorella",20,88))
    lista.append(Alumno("Daniela",19,90))
    lista.append(Alumno("Maria",24,97))
    lista.append(Alumno("Lucas",21,99))
    lista.append(Alumno("Diego",21,100))

    return lista

# Para imprimir la lista
def imprimir_lista(lista):
    for a in lista:
        a.imprimir()

# Realiza la busqueda binaria teniendo en cuenta la calificacion
def busqueda_binaria_calificacion(lista, calificacion):

    inicio = 0
    fin = len(lista)-1

    while (inicio <= fin):
        medio = int((fin+inicio)/2)

        # Comprueba si el objetivo está en el medio
        if lista[medio].calificacion == calificacion:
            return medio  # Devuelve el índice del objetivo

        # Si el objetivo es mayor que el elemento medio, ajusta la búsqueda a la mitad derecha
        elif lista[medio].calificacion < calificacion:
            inicio = medio + 1

        # Si el objetivo es menor que el elemento medio, ajusta la búsqueda a la mitad izquierda
        else:
            fin = medio - 1

    return -1 # Si no se encuentra el objetivo devuelve -1




## Programa principal
if __name__ == "__main__":
    
    print('Lista')
    lista = cargar_datos()

    imprimir_lista(lista)

    objetivo = 99
    indice_objetivo = busqueda_binaria_calificacion(lista, objetivo)

    if indice_objetivo == -1:
        print('No se encontro un alumno con esa calificacion')
    
    else:
        print('Alumno encontrado')
        lista[indice_objetivo].imprimir()

    