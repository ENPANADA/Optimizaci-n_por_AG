clc;
clear;
close all;

NumVariables = 3;
% LimiteInferior
LI = -20;     
% LimiteSuperior
LS = 20;

% Parametros
MaxGeneraciones = 50;
tamanoPoblacion = 10;  
Muestra = 10;
PresicionDeSeleccion = 0.5;

Resultado = ACO(NumVariables,LI,LS,MaxGeneraciones,tamanoPoblacion,Muestra,PresicionDeSeleccion);

% Resultados
figure;
plot(Resultado, 'LineWidth', 5);
xlabel('Generaciones');
ylabel('Mejor Solucion Encontrada');
grid on;

% Mostrar Grafica 3D
%[X,Y] = meshgrid(LI:0.25:LS);
%Z=floor(X).^2+floor(Y).^2;
%surfc(X,Y,Z)
%colorbar
%title('Step function')
%xlabel('Eje X')
%ylabel('Eje Y')
%zlabel('Eje Z')
