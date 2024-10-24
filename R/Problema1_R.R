cargar_datos <- function() {
    # Se utilizaran data frames para almacenar los registros
    alumnos <- data.frame(
        nombre = c("Diego", "Daniela", "Fiorella", "Ricardo", "Lucas", "Matias", "Andrea", "Maria"),
        edad = c(21, 19, 20, 22, 21, 18, 20, 24),
        calificacion = c(100, 90, 88, 66, 99, 45, 78, 97),
        stringsAsFactors = FALSE 
    )
    return (alumnos)
}

# Haremos una ordenacion por calificacion
quick_sort_calificacion <- function (lista) {
    # Caso base, cuando una lista tiene 0 o 1 elementos, entonces esta ordenada
    if (length(lista) <= 1) {
        return (lista)
    }

    # Cuando la lista tiene mas de un elemento

    # Primero elegimos el elemento pivote usando el metodo de mediana de 3
    a <- lista[1, ]  # Primer elemento
    b <- lista[nrow(lista) %/% 2 + 1, ]  # Elemento del medio
    c <- lista[nrow(lista), ]  # Último elemento

    # Hallar mediana
    if ((a$calificacion > b$calificacion && a$calificacion < c$calificacion) || (a$calificacion < b$calificacion && a$calificacion > c$calificacion)) {
        mediana <- a
    } else if ((b$calificacion > a$calificacion && b$calificacion < c$calificacion) || (b$calificacion < a$calificacion && b$calificacion > c$calificacion)) {
        mediana <- b
    } else {
        mediana <- c
    }

    lista_menores <- data.frame()  
    lista_mayores <- data.frame()   

    # Cargar listas con los elementos mayores y menores que la mediana
    for (i in 1:nrow(lista)) {
        elemento <- lista[i, ]
        if (elemento$calificacion < mediana$calificacion) {
            lista_menores <- rbind(lista_menores, elemento)  
        } else if (elemento$calificacion > mediana$calificacion) {
            lista_mayores <- rbind(lista_mayores, elemento)  
        }
    }

    # Ordenacion recursiva de las listas
    lista_menores <- quick_sort_calificacion(lista_menores)
    lista_mayores <- quick_sort_calificacion(lista_mayores)

    # Lista final ordenada
    lista_final <- rbind(lista_menores, mediana, lista_mayores)

    return (lista_final)
}

lista <- cargar_datos()

print("Antes de ordenar")
print(lista)

lista <- quick_sort_calificacion(lista)

print("Despues de ordenar")
print(lista)