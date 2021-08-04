%--------------------------- Presentación --------------------------------%
 
                  
 
disp ('Nombre de Investigacion: Investigacion Estudio de Parametros de Irradiacia')
   disp ('Autores: Lucia Verdugo Gonzales - Tito Peña-Montenegro - Janier Hersain Rosero')
      disp ('Año: 2021')  
                        disp ('UNIVERSIDAD MARIANA')
                        disp ('Ingenieria de Procesos')
                        
disp ('Descripcion: A continuacion se Presentara la Programacion Para evaluar un modelo Matematico Fenomenologico Propuesto para el Cultivo de Microalgas Chlorella sp.')
 
 
%------------------ Parametros Iniciales ---------------------------------%
 
Rango_de_Intensidades = double(input('Ingrese Rango de Intensidades:'))
Velocidad_Especifica = double(input('Ingrese Velocidad Especifica:'))
Consate_Media_de_Velocidad = (input('Ingrese Cosntante Velocidad Especifica (KI):'))
 
%------------------ Parametros de Fotoperiodo ----------------------------%
 
Fotoperiodo_1 = double(input('Ingrese Valor de Primer Fotoperiodo:'))
    Fotoperiodo_2 = double(input('Ingrese Valor de Segundo Fotoperiodo:'))
        Fotoperiodo_3 = double(input('Ingrese Valor de Tercer Fotoperiodo:'))
        
Dias_de_Cultivo = double(input('Ingrese Tiempo de Cultivo:'))
 
%------------------ Longitud de Onda -------------------------------------%
 
Longitud_de_Onda = double(input('Ingrese Valor de Longitud de Onda:'))
 
%------------------ Recopilacion de Parametros ---------------------------%
 
Umax= Velocidad_Especifica; ki = Consate_Media_de_Velocidad; B =0.05; L = Longitud_de_Onda;
T=Fotoperiodo_1; T2=Fotoperiodo_2; T3=Fotoperiodo_3; t= Dias_de_Cultivo; x = Rango_de_Intensidades;
h = (6.63e-34); v =(299792458) ; 
 
Relacion_Longitud_de_Onda = (L*1e-9);
Energia_de_foton = h*(v/Relacion_Longitud_de_Onda);
Intensidad_de_Longitud_de_Onda =(1e-16)/ Energia_de_foton ;
IL=Intensidad_de_Longitud_de_Onda';
n=5.13;
 
%% -------------------------- Ecuaciones ---------------------------------%
 
If = (x * sind((t*pi)./T)); If2 = (x * sind((t*pi)./T2)); If3 = (x * sind((t*pi)./T3));
 
% ----------------- Ecuaciones  del modelo propuesto ---------------------%
 
U1=(Umax.*x)./(ki + If + IL*B); 
    U2=(Umax.*x)./(ki+ If2 + IL*B);
        U3=(Umax.*x)./(ki+ If3 + IL*B);
        
% ----------------- Ecuaciones  del modelo de Tamiya ---------------------%
 
U4=((Umax.*x)./(ki+x)); 
 
% --------------- Ecuaciones  del modelo de Van Oorchot ------------------%
        
U5 =((Umax*(1-exp(-x./ki))));
 
% ----------------- Ecuaciones  del modelo de Molina ---------------------%
        
U6 =(Umax*((x).^n))./((ki+x).^n); 
 
% --------------------- Graficas del Modelo ------------------------------% 
 
figure(1);hold on ;plot(x,U3,'r --');plot(x,U2,'g --');plot(x,U1,'b --');plot(x,U4,'y --');plot(x,U5,'c --');plot(x,U6,'k --');
xlabel('Intensidad umol/m2 s'); ylabel('Velocidad de Crecimiento 1/h')
legend('Modelo Propuesto F3','Modelo Propuesto F2','Modelo Propuesto F1',' (Tamiya,H,. 1953) ','(Van Oorchot,J,. 1955)','Molina Grima, E,. 1993'); title('Todas la Graficas')
 
figure(2); plot(x,U3,'r --')
xlabel('Intensidad umol/m2 s'); ylabel('Velocidad de Crecimiento 1/h')
legend('10 Umax','5 Umax','1 Umax'); title('Grafica 3')
 
figure(3); plot(x,U2,'g --')
xlabel('Intensidad umol/m2 s'); ylabel('Velocidad de Crecimiento 1/h')
legend('10 Umax','5 Umax','1 Umax'); title('Grafica 2')
 
figure(4);plot(x,U1,'b --')
xlabel('Intensidad umol/m2 s'); ylabel('Velocidad de Crecimiento 1/h')
legend('10 Umax','5 Umax','1 Umax'); title('Grafica 4')
 
figure(5);plot(x,U4,'b --')
xlabel('Intensidad umol/m2 s'); ylabel('Velocidad de Crecimiento 1/h')
legend('(Tamiya,H,. 1953) '); title('Modelo de Tamiya')
 
figure(6);plot(x,U5,'b --')
xlabel('Intensidad umol/m2 s'); ylabel('Velocidad de Crecimiento 1/h')
legend('(Van Oorchot,J,. 1955)'); title('Modelo de Van Oorchot')
 
figure(7);plot(x,U6,'b --')
xlabel('Intensidad umol/m2 s'); ylabel('Velocidad de Crecimiento 1/h')
legend('Molina Grima, E,. 1993'); title('Modelo de Molina')

figure(8);hold on; plot(x,U3,'b --');plot(x,U4,'y --');plot(x,U5,'c --');plot(x,U6,'k --');plot(Inb,Ub,'r -o');
xlabel('Intensidad umol/m2 s'); ylabel('Velocidad de Crecimiento 1/h')
legend('Modelo Propuesto',' (Tamiya,H,. 1953) ','(Van Oorchot,J,. 1955)','Molina Grima, E,. 1993'); title('Todas la Graficas')
 
    
%-------------------------------------------------------------------------%
 
            disp('No cierre las Graficas si Dese Exportalas')
    
%------------------------- Obtencion de Graficas -------------------------%
 
                                 y = 1; n = 0;
V = string(input('¿Desea Exportar Figuras en Formato PNG? (y/n)')); P=str2double(V); 
 
                        if P > 0 ;
                                 figure(4);
                                    saveas(gcf,'Grafica1.png');
                                 figure(3);
                                    saveas(gcf,'Grafica2.png');
                                 figure(2);
                                    saveas(gcf,'Grafica3.png');
                                 figure(1);
                                    saveas(gcf,'Grafica4.png');
                                 figure(5);
                                    saveas(gcf,'Grafica5.png');
                                 figure(6);
                                    saveas(gcf,'Grafica6.png');
                                 figure(7);
                                    saveas(gcf,'Grafica7.png');
                            else P = 0;
                       disp('Gracias por Utilizar esta Herramienta')
                       end 
 
%------------------ Visualizacion de Datos -------------------------------%
 
In=Rango_de_Intensidades'; Uk=U1'; Uk2=U2'; Uk3=U3';Uk4=U4';Uk5=U5';Uk6=U6';
 
Irradiancia = [In];
   Velocidad_de_Crecimiento_Fotoperiodo_1 = [Uk];
      Velocidad_de_Crecimiento_Fotoperiodo_2 = [Uk2];
         Velocidad_de_Crecimiento_Fotoperiodo_3 = [Uk3];
            Velocidad_de_Crecimiento_Tamiya = [Uk4];
               Velocidad_de_Crecimiento_Van_Oorchot = [Uk5];
                  Velocidad_de_Crecimiento_Molina = [Uk6];
                  
T = table(Irradiancia, Velocidad_de_Crecimiento_Fotoperiodo_1, Velocidad_de_Crecimiento_Fotoperiodo_2,Velocidad_de_Crecimiento_Fotoperiodo_3, Velocidad_de_Crecimiento_Tamiya, Velocidad_de_Crecimiento_Van_Oorchot, Velocidad_de_Crecimiento_Molina)
 
%------------------------- Obtencion de Datos ----------------------------%
 
                               Y = 1; N = 0;
           D= string(input('¿Desea Exportar los datos un Formato de Excel? (Y/N)')); 
                     J=str2double(D); 
 
                       if J > 0;
                           
Datos = menu('Formatos para Exportar Datos', 'Excel.XLS (1)', 'Excel.XLSM (2)', 'Excel.XLSX (3)'); 
    
%-------------------------------------------------------------------------%
 
                  X1= In ; X2=Uk; X3=Uk2; X4=Uk3; X5=Uk4; X6=Uk5; X7=Uk6;
                  
%-------------------------------------------------------------------------%
 
      xlswrite('Datos_exportados.xls',X1,'Estimaciones','A1');
        xlswrite('Datos_exportados.xls',X2,'Estimaciones','B1');
            xlswrite('Datos_exportados.xls',X3,'Estimaciones','C1'); 
      xlswrite('Datos_exportados.xls',X4,'Estimaciones','D1');
        xlswrite('Datos_exportados.xls',X5,'Estimaciones','E1');
          xlswrite('Datos_exportados.xls',X6,'Estimaciones','F1');
      xlswrite('Datos_exportados.xls',X7,'Estimaciones','G1');
    
      xlswrite('Datos_exportados.xlsx',X1,'Estimaciones','A1');
        xlswrite('Datos_exportados.xlsx',X2,'Estimaciones','B1');
            xlswrite('Datos_exportados.xlsx',X3,'Estimaciones','C1'); 
      xlswrite('Datos_exportados.xlsx',X4,'Estimaciones','D1');
        xlswrite('Datos_exportados.xlsx',X5,'Estimaciones','E1');
          xlswrite('Datos_exportados.xlsx',X6,'Estimaciones','F1');
      xlswrite('Datos_exportados.xlsx',X7,'Estimaciones','G1');
  
      xlswrite('Datos_exportados.xlsm',X1,'Estimaciones','A1');
        xlswrite('Datos_exportados.xlsm',X2,'Estimaciones','B1');
            xlswrite('Datos_exportados.xlsm',X3,'Estimaciones','C1'); 
      xlswrite('Datos_exportados.xlsm',X4,'Estimaciones','D1');
        xlswrite('Datos_exportados.xlsm',X5,'Estimaciones','E1');
          xlswrite('Datos_exportados.xlsm',X6,'Estimaciones','F1');
      xlswrite('Datos_exportados.xlsm',X7,'Estimaciones','G1');
    
                       else J = 0;
    disp('Gracias por Utilizar esta Herramienta')
                      end
 
%-------------------------------------------------------------------------%
 
             disp ('Este Programa Ha Finalizado. Gracias!')
 
%-------------------------------------------------------------------------%

