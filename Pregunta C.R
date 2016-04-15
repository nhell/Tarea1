#C)

###importar datos

setwd("/home/nhell/Escritorio/Escritorio/CLASES")

### definicion de variable

datos<-read.table("NuAstro_4yr_IceCube_Data.txt", header = TRUE)

### Datos incompletos

datos <- na.omit(datos)

### promedio para las topologias - 1

library(data.table)  ### llamar la libreria

promedio = data.table(datos)

promedio[,list( Mean=mean(Med_Ang_Res_deg)), by = 'Topology']

### promedio para las topologias - 2 

Shower0=subset(datos[,8:9], Topology == 'Track', selec = Med_Ang_Res_deg)
Track0=subset(datos[,8:9], Topology == 'Shower', select = Med_Ang_Res_deg)
Resultado = data.table(Track=mean(Track0[,"Med_Ang_Res_deg"]) ,Shower=mean(Shower0[,"Med_Ang_Res_deg"]))

View(Resultado)