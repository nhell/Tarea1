##Esta funcion me permite calcular el dia juliano modificado entre los años 1801 y 2099

Modificado <- function(D,M,Y)
{
  
  JD = D - 32075 + 1461*( Y + 4800 + ( M - 14 ) / 12 ) / 4 + 
    367*( M - 2 - ( M - 14 ) / 12 * 12 ) / 12 
  - 3*( ( Y + 4900 + ( M - 14 ) / 12 ) / 100 ) / 4
  
  
 MJD <- JD-2400000.5
 
  View(MJD)
  return(MJD)
}

# ingresar fecha en formarto d-m-Y en la funcion

