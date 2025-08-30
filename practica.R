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

