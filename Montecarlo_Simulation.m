Umax = 2; I = 5;
ki = 1; B = 0.05;
% No. of needle throws
for n = [10:10:10000] % Intensidades
    x = (I/2).*rand(n,1);
    theta = (pi).*rand(n,1);
    crossings = 0;
    for k = 1:n
        if (Umax.*I)/(ki+I+B) >= x(k)
            crossings = crossings+1;
        end
    end
    p = crossings/n;
    Sat(ki) = (2*Umax)/(p*I);
    ki = ki+1;
end

Sat
n = 10:10:10000;
figure(1); plot(n,Sat,'-o',[0 max(n)],[0 200],'r')
xlabel('Estimacion de Intensidad'),ylabel('Estimacion to Crecimiento'),title('Prueba de Montecarlo')
grid on