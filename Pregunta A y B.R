#A)

###importar datos

setwd("/home/nhell/Escritorio/Escritorio/CLASES")

### definicion de variable

datos<-read.table("NuAstro_4yr_IceCube_Data.txt", header = TRUE)

#B)

### Datos incompletos

datos <- na.omit(datos)