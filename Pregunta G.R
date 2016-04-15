# G)

###importar datos

setwd("/home/nhell/Escritorio/Escritorio/CLASES")

### definicion de variable

datos<-read.table("NuAstro_4yr_IceCube_Data.txt", header = TRUE)

x =c()
y =c()

for (X in 1:nrow(datos))
{
  x = c(x,datos[,7][X]) #Declinacion
  y = c(y,datos[,6][X]) #Ascension
  
}

plot(y,x,main="distribución de los eventos", xlab="ascensión", ylab = "declinación")