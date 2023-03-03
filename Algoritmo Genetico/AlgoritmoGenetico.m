function Resultado = AlgoritmoGenetico(funcion,parametro,nVar)

  % Variables
  CostoFunction = funcion.CostoFunction;
  Min = funcion.Min;
  Max = funcion.Max;
  varSize = [1,nVar];
  
  % Parametros
  maxG = parametro.maxGeneraciones;
  I_por_G = parametro.IndividuosPorGeneracion;
  nC = round(1*I_por_G/2)*2;
  mutacion = parametro.probabilidad_mutacion;
  sigma = parametro.sigma;
  explorar = parametro.explorar;
  
  % Plantilla de individuo
  Individuo.Posicion = [];
  Individuo.Costo = [];  
  % Mejor Solución Encontrada
  MejorSolucion.Costo = inf;
 
  %% INICIALIZACIÓN
  ArrayIndividuos = repmat(Individuo,I_por_G,1);

  for i = 1:I_por_G
    % Generar una solución aleatoria
    ArrayIndividuos(i).Posicion = unifrnd(Min,Max,varSize);
    % Evaluar la solución aleatoria
    ArrayIndividuos(i).Costo = CostoFunction(ArrayIndividuos(i).Posicion);
    % Comparacion de la solución con la mejor solución jamás encontrada
    if ArrayIndividuos(i).Costo < MejorSolucion.Costo 
        MejorSolucion.Costo = ArrayIndividuos(i).Costo;
        MejorSolucion = ArrayIndividuos(i);
    end
  end
  
  % Mejor costo por iteración
  MSE = nan(maxG,1);
  
  %% LOOP PRINCIPAL
  
  for it = 1:maxG
    % Inicializar la población
    poblacion = repmat(Individuo,nC/2,2);

    % Cruzamiento
    for k = 1:nC/2
      % Seleccionar padres aleatoriamente
      q = randperm(I_por_G);
      Padre1 = ArrayIndividuos(q(1));
      Padre2 = ArrayIndividuos(q(2));
      % Hacer el cruce
      [poblacion(k,1).Posicion, poblacion(k,2).Posicion] = Cruce(Padre1.Posicion,Padre2.Posicion,explorar);
    end
    
    % Convierte la poblacion en una matriz de una sola columna
    poblacion = poblacion(:);
    
    % Mutacion
    for l = 1:nC
        % Hacer la mutación
        poblacion(l).Posicion = Mutacion(poblacion(l).Posicion,mutacion,sigma);
        % Compruebar límite inferior
        poblacion(l).Posicion = max(poblacion(l).Posicion,Min);
        % Compruebar límite superior
        poblacion(l).Posicion = min(poblacion(l).Posicion,Max);
        % Evaluar la solución
        poblacion(l).Costo = CostoFunction(poblacion(l).Posicion);
        if poblacion(l).Costo < MejorSolucion.Costo 
          MejorSolucion.Costo = poblacion(l).Costo;
          MejorSolucion = poblacion(l);
        end
    end
    
    % Fusionar poblaciones
    ArrayIndividuos = [ArrayIndividuos;poblacion];
    % Ordenar la población
    [~,sOrder] = sort([ArrayIndividuos.Costo]);
    ArrayIndividuos = ArrayIndividuos(sOrder);
    % Eliminar los valores adicionales 
    ArrayIndividuos = ArrayIndividuos(1:I_por_G);
    % Actualiza el mejor costo encontrado en esta generacion
    MSE(it) = MejorSolucion.Costo;
    % Mostrar información por generacion
    disp(['Generacion #' num2str(it) ' - Mejor solucion encontrada = ' num2str(MSE(it))]);
 
 end
  
  %% Resultados
  Resultado.ArrayIndividuos = ArrayIndividuos;
  Resultado.MejorSolucion = MejorSolucion;
  Resultado.MSE = MSE;
  
end