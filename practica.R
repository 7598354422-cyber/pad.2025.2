# mi primera practica en R

#alt+-

x <- "hola"
y <- "untrm"

# f(x, y) =x + x^2 + 2xy

# ayuda: F1 | Fn + F1

paste(x, y)

paste(x, y, sep = " + ")


paste(X, y)


#tidyverse cran

library(tidyverse)

# pipe

a1 <- "estudiante"
1a <-  "cocina"

a_1 <-"objeto"
a.1 <- "a"
a-1 <- "b"

notas <- c(16, 17, 19, 15)
media <-  mean(notas)
media

# ctrl + shift + m => %>%

m <- c(16, 17, 19, 15) %>% 
  mean()
m

#Funciones

x<- "hola"
y<- "untrm"

paste(x,y)

saludo <- function() {
  
  
  x<- "hola"
  y<- "untrm"
  paste(x,y)
  
}






#
saludo2 <- function(quien) {
  
  
  x<- "hola"
  y<- quien
  paste(x,y)
  
}
saludo2(quien = "FICA")
saludo2(quien = "LESLI")




saludo3 <- function(texto, quien) {
  
x<- texto
y<- quien
paste(x,y)
  
}
saludo3(texto = "como estas", quien = "LESLI")


nota <- function(PA, AC, Ex) {

  x<- PA*0.3
  y<- AC*0.2
  z<- Ex*0.5
  x +y +z
}
nota (PA = 19, AC= 15 , Ex = 16.2)
 

#Crear una funcion para determinar el área de una circunferencia
el usuario debe seleccionar si es en cm o mm

"area circ" <- function(radio) {
pi*radio^2
}
"area circ"(2)
