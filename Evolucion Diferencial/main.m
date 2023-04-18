clc;
clear;
close all;

%% Variables

% función de costo
CostoFuncion = @(x) Step_Function(x);    
% Número de variables de decisión
NumVar = 10;           
% Tamaño de la matriz de variables de decisión
VarSize = [1 NumVar];   
% Límite inferior
LimiteInferior = -20;          
% Límite superior
LimiteSuperior = 20;          

%% Parametros

% Número máximo de iteraciones
IteracionesMax = 50;      
% Tamaño de la poblacion
TamPoblacion = 50;        
% Límite inferior del factor de escala
EscalaMin = 0.2;   
% Límite superior del factor de escala
EscalaMax = 0.8;   
% Probabilidad de cruce
ProbabilidadCruce = 0.2; 

%%Correr Algoritmo
Resultado = DE(CostoFuncion,VarSize,LimiteInferior,LimiteSuperior,IteracionesMax,TamPoblacion,EscalaMin,EscalaMax,ProbabilidadCruce);

%% Mostrar resultados
figure;
semilogy(Resultado, 'LineWidth', 5);
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