function Resultado = ACO(NumVariables,LI,LS,MaxGeneraciones,tamanoPoblacion,Muestra,PresicionDeSeleccion)
    
    % Funcion
    CostoFuncion = @(x) Step_Function(x);
    Matriz = [1 NumVariables];
    zeta = 1;
    % Crear estructura individual vacía
    Individuo.Posicion = [];
    Individuo.Costo = [];
    % Crear matriz de población
    MatrizPoblacion = repmat(Individuo, tamanoPoblacion, 1);
    
    % Inicializar miembros de la población
    for i = 1:tamanoPoblacion
        % Crear solución aleatoria
        MatrizPoblacion(i).Posicion = unifrnd(LI, LS, Matriz);
        % Evaluacion
        MatrizPoblacion(i).Costo = CostoFuncion(MatrizPoblacion(i).Posicion);
    end
    
    % Ordenar Población
    [~, SortOrder] = sort([MatrizPoblacion.Costo]);
    MatrizPoblacion = MatrizPoblacion(SortOrder);
    % Actualizar la mejor solución jamás encontrada
    MejorSolucion = MatrizPoblacion(1);
    % Matriz para mantener los mejores valores de costo
    MejorCosto = zeros(MaxGeneraciones, 1);
    % Solucion
    SumatoriaDeSoluciones = 1/(sqrt(2*pi)*PresicionDeSeleccion*tamanoPoblacion)*exp(-0.5*(((1:tamanoPoblacion)-1)/(PresicionDeSeleccion*tamanoPoblacion)).^2);
    % Probabilidades de selección
    Probabilidad = SumatoriaDeSoluciones/sum(SumatoriaDeSoluciones);
    
    for Generacion = 1:MaxGeneraciones
        s = zeros(tamanoPoblacion, NumVariables);
        for l = 1:tamanoPoblacion
            s(l, :) = MatrizPoblacion(l).Posicion;
        end
    
        % Desviaciones estandar
        sigma = zeros(tamanoPoblacion, NumVariables);
        for l = 1:tamanoPoblacion
            D = 0;
            for r = 1:tamanoPoblacion
                D = D+abs(s(l, :)-s(r, :));
            end
            sigma(l, :) = zeta*D/(tamanoPoblacion-1);
        end
        
        % Crear nueva matriz de población
        NuevaPoblacion = repmat(Individuo, Muestra, 1);
        for t = 1:Muestra
            % Inicializar matriz de posición
            NuevaPoblacion(t).Posicion = zeros(Matriz);
            % Construcción de soluciones
            for i = 1:NumVariables
                % Seleccionar kernel gaussiano
                l = Ruleta(Probabilidad);
                % Generar variable aleatoria gaussiana
                NuevaPoblacion(t).Posicion(i) = s(l, i)+sigma(l, i)*randn;
            end
            % Aplicar límites variables
            NuevaPoblacion(t).Posicion = max(NuevaPoblacion(t).Posicion, LI);
            NuevaPoblacion(t).Posicion = min(NuevaPoblacion(t).Posicion, LS);
            % Evaluación
            NuevaPoblacion(t).Costo = CostoFuncion(NuevaPoblacion(t).Posicion);  
        end
        
        % Fusionar población principal y población nueva
        MatrizPoblacion = [MatrizPoblacion
             NuevaPoblacion]; %#ok
        % Ordenar Población
        [~, SortOrder] = sort([MatrizPoblacion.Costo]);
        MatrizPoblacion = MatrizPoblacion(SortOrder);
        % Eliminar miembros adicionales
        MatrizPoblacion = MatrizPoblacion(1:tamanoPoblacion);
        % Actualizar la mejor solución jamás encontrada
        MejorSolucion = MatrizPoblacion(1);
        % Mejor Costo
        MejorCosto(Generacion) = MejorSolucion.Costo;
        % Mostrar información de generacion
        disp(['Generacion #' num2str(Generacion) ', Mejor Solucion Encontrada = ' num2str(MejorCosto(Generacion))]);
        
    end
    
    Resultado = MejorCosto;

end