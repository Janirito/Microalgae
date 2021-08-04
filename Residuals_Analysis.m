% Datos Obtenidos de Excel (Ingresar datos)


X=[0, 2.083333333, 1.529051988, 0.891901534, 0.882301041, 0.440722785, 0.289268152, 0.193685842, 0.16204829, 0.122714443, 0.059944851, 0.044851094, 0.014773013];
Y=[0, 3.356389534, 2.645787227,1.828944686, 1.816636619, 1.250522442, 1.056353879, 0.933815009, 0.893254891, 0.842827932, 0.762355772, 0.743005205, 0.704444365];

% Calculadora

SUMxy = sum(X.*Y);
SUMx = sum(X);
SUMy = sum(Y);
n = length(X);
SUMx2 = sum(X.*X);
SUMxthen2 = SUMx*SUMx;
slope_W = (((n)*(SUMxy)) - (SUMx*SUMy))/((n*SUMx2)-(SUMxthen2));
YIntercept_B = (SUMy/n)-(slope_W*(SUMx/n));
x=linspace(0,2.5);
eq_y = slope_W*x+YIntercept_B;
scatter(X,Y,'r o');
hold on;
plot(x,eq_y, 'b -');
xlabel('Obseved Values'); ylabel('Predictive Values')
legend({'Teorical Data','Proposed model'},'Location','southeast')
hold off;

Residuos = [ -0.055060026, -0.016927744, 0.026905586, 0.027566059, 0.057944822, 0.068364279, 0.074939949, 0.077116482, 0.079822487, 0.084140776, 0.085179172, 0.087248419,-0.197240262];
Intensidad = [ 2.083333333, 1.529051988, 0.891901534, 0.882301041, 0.440722785, 0.289268152, 0.193685842, 0.16204829,0.122714443, 0.059944851, 0.044851094, 0.014773013, 0];

figure(19);axis([-0.1 1.6 -0.25 0.12]);hold on;plot(Intensidad, Residuos,'o k'); h = stem(Intensidad, Residuos);
xlabel('Obseved Values'); ylabel('Predictive Values')
legend({'Proposed model','Residuals',},'Location','southeast')
set(h(1),'MarkerFaceColor','red')
grid on

subplot(2,2,[1,2])
scatter(X,Y,'r o'); hold on; plot(x,eq_y, 'b -');
xlabel('Obseved Values'); ylabel('Predictive Values')
legend({'Teorical Data','Proposed model'},'Location','southeast')
grid on

subplot(2,2,[3,4])
axis([-0.1 1.6 -0.25 0.12]);hold on;plot(Intensidad, Residuos,'o k'); h = stem(Intensidad, Residuos);
xlabel('Obseved Values'); ylabel('Predictive Values')
legend({'Proposed model','Residuals',},'Location','southeast')
set(h(1),'MarkerFaceColor','red')
grid on


