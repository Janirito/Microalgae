# Programming Growth Model microalgae

import pandas
import pandas as pd
from pandas import DataFrame
import numpy as np
import numpy
import matplotlib
import math
import numpy as np
import matplotlib.pyplot as plt
# Programming Growth of microalgae models (.py)


#--------------------------- Presentación --------------------------------%
 
                  
 
print("Nombre de Investigacion: Investigacion Estudio de Parametros de Irradiacia")
print("Autores: Lucia Verdugo Gonzales - Tito Peña-Montenegro - Janier Hersain Rosero")
print("Año: 2021")  
print("UNIVERSIDAD MARIANA")
print("Ingenieria de Procesos")
print("Descripcion: A continuacion se Presentara la Programacion Para evaluar un modelo Matematico Fenomenologico Propuesto para el Cultivo de Microalgas Chlorella sp.")
 
 
###X=[float(input("Ingrese Intensidades Experimentales (I): "))]
X =np.array([1.3,2.6,3.4,4.3,5.3,6.2,7.1,8.4,9.9,10.11])
Umax = float(input('Ingrese Velocidad Especifica de Crecimiento (Umax): '))
ki = float(input('Ingrese Constante de Saturacion (Ki): '))
T = float(input('Ingrese Fotoperiodo: '))
t = float(input('Ingrese Tiempo de Cultivo: '))
o = float(input('Ingrese Longitud de Onda: '))
v= 29972458;
## Wavelength Convertion & Constants
p = ((6.63e-34) * ((v)/o)); # Foton Energy
L = (1e-16/p); B = 0.05; n  = 1;

# System Equations

    ## Model Propoused
It = (X * math.sin(math.radians((t*numpy.pi)/T))) # First Ecuation
U1 = (Umax*X)/(ki + It + L*B)
    #---# Tamiya Model
U2 = (Umax*X)/(ki + X);
    #---# Oorchot Model
U3 = (Umax*(-1**(X/ki)));
    #---# Molina Grima Model
U4 = Umax * ((X)/ki+X)**n;
#---# Graficas

plt.plot(X,U1,marker="o",label="Propoused Model")
plt.plot(X,U2,marker="o",label="Tamiya Model")
plt.plot(X,U3,marker="o",label="Van Oorchot Model")
plt.plot(X,U4,marker="o",label="Molina Model")
plt.xlabel("Light intensiti (I)"); plt.ylabel("Growth (Umax)")
plt.legend(); plt.show()

import matplotlib.pyplot as plt

desicion1 = input('¿Desea Exportar las figura con modelos unificados? (Y/N): ')
if desicion1 == str("Y"):
    print("Recuerde que la figura se exportara en la ruta que ejecute este comando")
    plt.savefig("Figura_Unificada.png")

else:
    print("Usted no exporto las figuras")


fig, axs = plt.subplots(2, 2)
axs[0, 0].plot(X, U1); axs[0, 0].set_title('Propoused Model')
axs[0, 1].plot(X, U2, 'tab:orange'); axs[0, 1].set_title('Tamiya Model')
axs[1, 0].plot(X, -U3, 'tab:green'); axs[1, 0].set_title('Van Oorchot Model')
axs[1, 1].plot(X, -U4, 'tab:red'); axs[1, 1].set_title('Molina Model')

for ax in axs.flat:
    ax.set(xlabel='Light intensity (I)', ylabel='Growth (Umax)')
for ax in axs.flat:
    ax.label_outer()

desicion2 = input('¿Desea Exportar las figura con modelos individuales? (Y/N): ')
if desicion2 == str("Y"):
    print("Recuerde que la figura se exportara en la ruta que ejecute este comando")
    plt.savefig("Figuras_Individual.png")
else:
    print("Usted no exporto las figuras")

#---# Exportar Tablas 
V = X.T; V1 = U1.T; V2= U2.T; V3 = U3.T; V4 = U4.T
df = pd.DataFrame({'Intenisdad': [V], 
'p': [V1], 
'T': [V2],
'V': [V3],
'M': [V4]})
print(df.T)

desicion3 = input('¿Desea Exportar la tabla? (Y/N): ')
if desicion3 == str("Y"):
    print("Recuerde que la tabla se exportara en la ruta que ejecute este comando")
    ruta = ("Ingrese ruta de Exportacion")
    df.to_csv(ruta)
else:
    print("Usted no exporto la tabla")