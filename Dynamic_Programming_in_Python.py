# Dynamic Programming in Python


import pandas; import pandas as pd; from pandas import DataFrame
import numpy; import numpy as np
import matplotlib; import matplotlib.pyplot as plt
import math


#--------------------------- Presentación --------------------------------%
 
                  
 
print("Nombre de Investigacion: Investigacion Estudio de Parametros de Irradiacia")
print("Autores: Lucia Verdugo Gonzales - Tito Peña-Montenegro - Janier Hersain Rosero")
print("Año: 2021")  
print("UNIVERSIDAD MARIANA")
print("Ingenieria de Procesos")
print("Descripcion: A continuacion se Presentara la Programacion Para evaluar un modelo Matematico Fenomenologico Propuesto para el Cultivo de Microalgas Chlorella sp.")
 

Pregunta = input('¿ Desea Ingresar Manualmente los datos (Y/N) ?')
    

if Pregunta == str("Y"):
    
    print("Recuerde Ingresar todos los datos")
    
    x = []

    print('Ingrese la Cantidad Total de Valores de Intensidad')

    Data = int(input("Ingrese la Cantidad de Valores Totales : "))

    for i in range(0, Data):
        ele = float(input())
        x.append(float(ele)) 
    
    X = np.array([x])

    Umax = float(input('Ingrese Velocidad Especifica de Crecimiento (Umax): '))
    ki = float(input('Ingrese Constante de Saturacion (Ki): '))
    T = float(input('Ingrese Fotoperiodo: '))
    t = float(input('Ingrese Tiempo de Cultivo: '))
    o = float(input('Ingrese Longitud de Onda: '))

    ## Wavelength Convertion & Constants
    o= 700; to = o * 0.000000001; v= 29972458; 
    p = ((v*0.0000000000000000000000000000000063) * (1/to)); # Foton Energy
    L = (0.00000000000000001/p); B = 0.05; n  = 1;

                    # System Equations

    ## Model Propoused

    It = (X * math.sin(math.radians((t*numpy.pi)/T))) # First Ecuation

    # First Ecuation
    U1 = (Umax*X)/(ki + It + L*B)
    #---# Tamiya Model
    U2 = (Umax*X)/(ki + X);
    #---# Oorchot Model
    U3 = (Umax*(1-(numpy.exp(-X/ki))));
    #---# Molina Grima Model
    U4 = Umax * ((X)/(ki+X))**n;

    #---# Graphics
    
    desicion1 = input('¿Desea Exportar las figura ? (Y/N): ')
    
    if desicion1 == str("Y"):
    
        plt.plot(X[0],U1[0],'--o',  label = 'Propoused model', linewidth=8,color=(0.7,0,0))
        plt.plot(X[0],U2[0],'--o',  label = '(Tamiya,H,. 1953)', linewidth=2,color=(0.2,1,0))
        plt.plot(X[0],U3,'--o',  label = '(Van Oorchot,J,. 1955)', linewidth=2,color=(0.4,0.5,1))
        plt.plot(X[0],U4[0],'--o',  label = '(Molina,G ,. 1997)', linewidth=2,color=(0.4,0.2,0.6))
        plt.xlabel("Light intensiti (I)"); plt.ylabel("Growth (Umax)")
        plt.legend(); plt.show()
        plt.savefig("Graficas_Unificadas.jpg")

    else:
        print('No Exporto las Graficas')


    desicion2 = input('¿Desea Visualizar Tabla ? (Y/N): ')
    
    if desicion2 == str("Y"):    

        # Tables Generate
        import pandas as pd

        V = X[0].T; V1 = U1[0].T; V2= U2[0].T; V3 = U3[0].T; V4 = U4[0].T
        datos = {'Intensidad':V, 
        'Propuesto':V1,
        '(Tamiya,H,. 1953)':V2,
        '(Van Oorchot,J,. 1955)':V3, 
        '(Molina,G ,. 1997)':V4}

        df = pd.DataFrame(datos)
        print (df) 
        desicion3 = input('¿Desea Exportar Tabla ? (Y/N): ')
    
        if desicion3 == str("Y"): 
            
            import pandas
            import pandas as pd

            ruta = input('Ingrese Ruta de Exportacion y Nombre de Archivo: ')
            df.to_excel(ruta, engine = 'openpyxl')
        else: 
            print("Usted no exporto las figuras")
    

        # Statistics Predictions

    desicion4 = input('¿ Desea Vizualizar el Analisis Estadistico ? (Y/N): ')
    
    if desicion4 == str("Y"):

        print("Recuerde Ingresar todos los datos")
    
        theorical = []
        
        Theorical_Data = int(input("Ingrese la Cantidad de Valores Teoricos Totales: "))

        for i in range(0, Theorical_Data):
            ele_2 = float(input())
            theorical.append(float(ele_2)) 
        X_t = np.array([theorical])

        theorical_err = []
        
        Theorical_err = int(input("Ingrese la Desviacion de Valores Totales: "))

        for i in range(0, Theorical_err):
            ele_3 = float(input())
            theorical_err.append(float(ele_3)) 
        X_e = np.array([theorical_err])

        # Aesthetic Graphics

        U1 = (Umax*X)/(ki + It + L*B)
        
        Residuals = X_t[0] - U1[0];

        fig = plt.figure(figsize=(20,7))

        ax_1 = fig.add_subplot(121)   

        plt.plot(X[0], X_t[0],'d',  label = 'Theorical Data', linewidth=8,color=(0.7,0,0))
        plt.plot(X[0], U1[0],'--o',  label = '(Tamiya,H,. 1953)', linewidth=2,color=(0.2,1,0))
        plt.plot(X[0], U2[0],'--o',  label = 'Proposed model', linewidth=2,color=(0.4,0.5,1))
        plt.plot(X[0], U3[0],'--o',  label = '(Van Oorchot,J,. 1955)', linewidth=2,color=(0.4,0.2,0.6))
        plt.plot(X[0], U4[0],'--o', label = '(Molina Grima, E,. 1993)',linewidth=2,color=(1,0.3,0.4))
        plt.legend()
        plt.xlabel(r"Light Intensity ($μmol\,m^{-2}\,s^{-1}$)");plt.ylabel(r"Growth ($day^{-1}$)")

        ax_2 = fig.add_subplot(222)
        plt.plot(X[0], X_t[0],'d',  label = 'Theorical Data', linewidth=8,color=(0.7,0,0))
        plt.plot(X[0], U1[0],'--o',  label = 'Proposed model', linewidth=2,color=(0.4,0.5,1))
        plt.errorbar(X[0], U1[0], X_e[0], label = 'Standard Deviation', capsize=5 ,linewidth=2,color=(0.1,0,0.1),fmt ='o') 
        plt.legend(); plt.legend(loc='lower right')
        plt.xlabel(r"Light Intensity ($μmol\,m^{-2}\,s^{-1}$)"); plt.ylabel(r"Growth ($day^{-1}$)")

        ax_3 = fig.add_subplot(224)
        plt.stem(X[0], Residuals, linefmt='blue',markerfmt='o r',basefmt='b-')
        plt.xlabel('Obseved Values'); plt.ylabel('Predictive Values')
        plt.show()
else:

    print('No selecciono Ninguna Operacion')





