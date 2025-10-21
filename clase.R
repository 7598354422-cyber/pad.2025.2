
# IMPORTAR DATOS ----------------------------------------------------------


# importar datos csv ------------------------------------------------------

library(readr)
FB <- read_csv("C:/Users/User/Downloads/LA MOLINA 2014 POTATO WUE (FB) - fb.csv")
View(FB)


# importar xlsx -----------------------------------------------------------

library(readxl)
fb <- read_excel("C:/Users/User/Downloads/LA MOLINA 2014 POTATO WUE (FB).xlsx", 
                 sheet = "fb")
View(fb)

# google sheets -----------------------------------------------------------

library(googlesheets4)
library(tidyverse)
url <- "https://docs.google.com/spreadsheets/d/15r7ZwcZZHbEgltlF6gSFvCTFA-CFzVBWwg3mFlRyKPs/edit?gid=1263018298#gid=1263018298"

gs <- url %>%
  as_sheets_id()
fb <- gs %>%
  range_read(sheet = "fb")

#1. darle el url
#2. extraer la informacion de la hoja de calculo
#3. importar hoja de calculo


