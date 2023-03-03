clc;
clear;
close all;

%% Optimización por algoritmos genéticos
funcion.CostoFunction = @(x) StepFunction(x);
% X, Y, Z
Num_Variables = 3;
% Limite inferior
LI = -20;
% Limite superior
LS = 20;
funcion.Min = [LI LI LI];
funcion.Max = [LS LS LS];

%% Parametros del algoritmo
parametro.IndividuosPorGeneracion = 10;
parametro.maxGeneraciones = 50;
parametro.probabilidad_mutacion = 0.1;
% Operación de mutación normal con pasos gaussianos
parametro.sigma = 0.1;
% Rango que explora el algoritmo (no mayor que 1)
parametro.explorar = 0.1;

%% Correr AG
Resultado = AlgoritmoGenetico(funcion,parametro,Num_Variables);

%% Resultados
figure;
plot(Resultado.MSE,'linewidth',5);
xlabel('Generaciones');
ylabel('Mejor Solucion Encontrada');
grid on;