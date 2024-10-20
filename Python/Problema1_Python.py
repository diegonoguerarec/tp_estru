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

    lista.append(Alumno("Diego",21,100))
    lista.append(Alumno("Daniela",19,90))
    lista.append(Alumno("Fiorella",20,88))
    lista.append(Alumno("Ricardo",22,66))
    lista.append(Alumno("Lucas",21,99))
    lista.append(Alumno("Matias",18,45))
    lista.append(Alumno("Andrea",20,78))
    lista.append(Alumno("Maria",24,97))

    return lista

# Para imprimir la lista antes y despues de ordenar
def imprimir_lista(lista):
    for a in lista:
        a.imprimir()

# Haremos una ordenacion por calificacion
def quick_sort_calificacion(lista):

    # Caso base, cuando una lista tiene 0 o 1 elementos, entonces esta ordenada
    if len(lista) <= 1:
        return lista
    
    # Cuando la lista tiene mas de un elemento

    # Primero elegimos el elemento pivote usando el metodo de mediana de 3
    a = lista[0]  # Primer elemento
    b = lista[len(lista) // 2]  # Elemento del medio
    c = lista[-1]  # Último elemento

    # Hallar mediana
    if (a.calificacion > b.calificacion and a.calificacion < c.calificacion) or (a.calificacion < b.calificacion and a.calificacion > c.calificacion):
        mediana = a
    elif (b.calificacion > a.calificacion and b.calificacion < c.calificacion) or (b.calificacion < a.calificacion and b.calificacion > c.calificacion):
        mediana = b
    else:
        mediana = c

    lista_menores = []
    lista_mayores = []

    # Cargar listas con los elementos mayores y menores que la mediana
    for elemento in lista:
        if elemento.calificacion < mediana.calificacion:
            lista_menores.append(elemento)
        
        elif elemento.calificacion > mediana.calificacion:
            lista_mayores.append(elemento)
 
    # Ordenacion recursiva de las listas
    lista_menores = quick_sort_calificacion(lista_menores)
    lista_mayores = quick_sort_calificacion(lista_mayores)

    # Lista final ordenada
    lista_final = lista_menores + [mediana] + lista_mayores

    return lista_final
 


## Programa principal
if __name__ == "__main__":
    
    print('Antes de ordenar')
    lista = cargar_datos()

    imprimir_lista(lista)

    lista = quick_sort_calificacion(lista)

    print('Despues de ordenar')
    imprimir_lista(lista)

    









