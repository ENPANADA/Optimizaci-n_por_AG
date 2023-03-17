clear;
close all;

%% Definición del problema

% función de costo
CostoFuncion = @(x) Step_Function(x);

% Número de variables de decisión
nVar = 10;
% Tamaño de la matriz de variables de decisión
VarSize = [1 nVar];
% Límite inferior de variables
VarMin = -20; 
% Límite superior de variables
VarMax = 20;         

%% PSO Parámetros

% Número máximo de iteraciones
MaxGeneraciones = 1000;
% Tamaño de la población (tamaño del enjambre)
nPop = 100;        
% Inercia Peso
w = 1;     
% Inercia Peso Relación de amortiguamiento
wdamp = 0.99;   
% Coeficiente de aprendizaje personal
c1 = 1.5;    
% Coeficiente de aprendizaje global
c2 = 2.0;  

% Ejecutar Algoritmo de Optimizacion
Resultado = PSO(CostoFuncion,VarSize,VarMin,VarMax,MaxGeneraciones,nPop,w,wdamp,c1,c2);

%% Resultados

figure;
semilogy(Resultado, 'LineWidth', 5);
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
