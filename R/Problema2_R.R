cargar_datos <- function() {
    # Se utilizaran data frames para almacenar los registros
    alumnos <- data.frame(
        nombre = c("Matias", "Ricardo", "Andrea", "Fiorella", "Daniela", "Maria", "Lucas", "Diego"),
        edad = c(18, 22, 20, 20, 19, 24, 21, 21),
        calificacion = c(45, 66, 78, 88, 90, 97, 99, 100),
        stringsAsFactors = FALSE
    )
    return(alumnos)
}

busqueda_binaria_calificacion <- function (lista, calificacion) {
    inicio <- 1
    fin <- nrow(lista)

    while (inicio <= fin) {
        medio <- (fin + inicio) %/% 2
        
        # Compruena si el objetivo esta en el medio
        if (lista[[medio, "calificacion"]] == calificacion) {
            return (medio) # Devuelve el índice del objetivo
        } else if (lista[[medio, "calificacion"]] < calificacion) {
            inicio <- medio + 1
        } else {
            fin <- medio - 1
        }
    }

    return (-1)
}




lista <- cargar_datos()

print("Lista")
print(lista)

objetivo <- 90
indice_objetivo <- busqueda_binaria_calificacion(lista, objetivo)


if (indice_objetivo == -1) {
    print('No se encontro un alumno con esa calificacion')
} else {
    print('Alumno encontrado')
    print(lista[indice_objetivo, ])
}