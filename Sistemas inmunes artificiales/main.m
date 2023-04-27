clear;
close all;

%% Definir la función a optimizar
f = @(x) stepFunction(x);

%% Parámetros del algoritmo

% número de anticuerpos
N = 10;
% número máximo de iteraciones
max_iter = 50;
% probabilidad de clonación
p_c = 0.2;
% coeficiente de afinidad
beta = 2;
% probabilidad de mutación
p_m = 0.1;
% desviación estándar para la mutación gaussiana
sigma = 0.1;

%% Ejecucion del Algoritmo
Resultado = OAIS(f, N, max_iter, p_c, beta, p_m, sigma);

%% Mostrar Resultados
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