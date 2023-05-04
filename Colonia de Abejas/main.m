clc;
clear;
close all;

%% Parametros

%Función de costo
CostoFuncion = @(x) Step_Function(x);        
%Número de variables de decisión
NumVar = 5;               
%Límite inferior de las variables de decisión
LimiteInferior = -20; 
%Límite superior de las variables de decisión
LimiteSuperior = 20;         
%Número máximo de iteraciones
Generaciones = 50;              
%Tamaño de la población
TamPoblacion = 50;  

Resultado = ABC(CostoFuncion,NumVar,LimiteInferior,LimiteSuperior,Generaciones,TamPoblacion);

%% Resultados
    
figure;
plot(Resultado, 'LineWidth', 5);
xlabel('Generacion');
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