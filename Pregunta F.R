# F)

###importar datos

setwd("/home/nhell/Escritorio/Escritorio/CLASES")

### definicion de variable

datos<-read.table("NuAstro_4yr_IceCube_Data.txt", header = TRUE)

### Datos incompletos

datos <- na.omit(datos)

library(data.table)  ### llamar la libreria


mjd2posix <- function(MJD)
{
  
  jd = MJD+ 2400000.5
  DAY = round((jd + 68569) - (146097*((4*(jd + 68569))%/%146097)+3)%/%4 - (1461*((4000*((jd + 68569) - (146097*((4*(jd + 68569))%/%146097)+3)%/%4+1))%/%1461001))%/%4 + 31-(2447*((80*((jd + 68569) - (146097*((4*(jd + 68569))%/%146097)+3)%/%4 - (1461*((4000*((jd + 68569) - (146097*((4*(jd + 68569))%/%146097)+3)%/%4+1))%/%1461001))%/%4 + 31))%/%2447))%/%80,digits=0)
  MONTH = (80*((jd + 68569) - (146097*((4*(jd + 68569))%/%146097)+3)%/%4 - (1461*((4000*((jd + 68569) - (146097*((4*(jd + 68569))%/%146097)+3)%/%4+1))%/%1461001))%/%4 + 31))%/%2447 + 2 - (12*(((80*((jd + 68569) - (146097*((4*(jd + 68569))%/%146097)+3)%/%4 - (1461*((4000*((jd + 68569) - (146097*((4*(jd + 68569))%/%146097)+3)%/%4+1))%/%1461001))%/%4 + 31))%/%2447)%/%11))
  YEAR = 100*((4*(jd + 68569))%/%146097-49) + (4000*((jd + 68569) - (146097*((4*(jd + 68569))%/%146097)+3)%/%4+1))%/%1461001 + ((80*((jd + 68569) - (146097*((4*(jd + 68569))%/%146097)+3)%/%4 - (1461*((4000*((jd + 68569) - (146097*((4*(jd + 68569))%/%146097)+3)%/%4+1))%/%1461001))%/%4 + 31))%/%2447)%/%11
  gd <- as.character(as.Date(paste(c(DAY,MONTH,YEAR),collapse = "-"), format="%d-%m-%Y"))
  return(gd)
}

m<-matrix(datos[,5])

add<-data.table("Time_MGD"=lapply(m,mjd2posix))

datosupdate=data.table(datos,add)


mes<-as.POSIXlt(mapply(mjd2posix,c(m)))$mon # "cero equivale a enero,..,..,..., 11 a diciembre"
mes


max(data.table(mes)) # "mes con el mayor número de eventos."




