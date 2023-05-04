function Resultado = ABC(CostoFuncion,NumVar,LimiteInferior,LimiteSuperior,Generaciones,TamPoblacion)
    %Tamaño de la matriz de variables de decisión
    MatrizVar = [1 NumVar]; 
    %Número de abejas espectadoras
    AbejaAFK = TamPoblacion;
    %Parámetro de límite de abandono
    L = round(0.6*NumVar*TamPoblacion); 
    %Límite superior del coeficiente de aceleración
    a = 1;                    
    
    %% Inicialización
    
    %Estructura de abeja vacía
    AbejaVacia.Posicion = [];
    AbejaVacia.Costo = [];
    %Inicializar matriz de población
    Poblacion = repmat(AbejaVacia, TamPoblacion, 1);
    %Inicializar la mejor solución encontrada
    MejorSolucion.Costo = inf;
    % Crear población inicial
    for i = 1:TamPoblacion
        Poblacion(i).Posicion = unifrnd(LimiteInferior, LimiteSuperior, MatrizVar);
        Poblacion(i).Costo = CostoFuncion(Poblacion(i).Posicion);
        if Poblacion(i).Costo <= MejorSolucion.Costo
            MejorSolucion = Poblacion(i);
        end
    end
    %Contador de abandono
    Contador = zeros(TamPoblacion, 1);
    %Matriz para mantener los mejores valores de costo
    MejorCosto = zeros(Generaciones, 1);
    
    %% Bucle principal
    
    for Iteracion = 1:Generaciones
        %Abejas reclutadas
        for i = 1:TamPoblacion
            %Se elije k al azar, no igual a i
            K = [1:i-1 i+1:TamPoblacion];
            k = K(randi([1 numel(K)]));
            %Definir el coeficiente de aceleración
            phi = a*unifrnd(-1, +1, MatrizVar);
            %Nueva posición de abeja
            NuevaAbeja.Posicion = Poblacion(i).Posicion+phi.*(Poblacion(i).Posicion-Poblacion(k).Posicion);
            %Aplicar límites
            NuevaAbeja.Posicion = max(NuevaAbeja.Posicion, LimiteInferior);
            NuevaAbeja.Posicion = min(NuevaAbeja.Posicion, LimiteSuperior);
            %Evaluación
            NuevaAbeja.Costo = CostoFuncion(NuevaAbeja.Posicion);
            %Comparación
            if NuevaAbeja.Costo <= Poblacion(i).Costo
                Poblacion(i) = NuevaAbeja;
            else
                Contador(i) = Contador(i)+1;
            end
        end
        %Calcular valores de aptitud y probabilidades de selección
        F = zeros(TamPoblacion, 1);
        CostoPromedio = mean([Poblacion.Costo]);
        %Convertir Costo a Aptitud
        for i = 1:TamPoblacion
            F(i) = exp(-Poblacion(i).Costo/CostoPromedio); 
        end
        P = F/sum(F);
        %Abejas espectadoras
        for m = 1:AbejaAFK
            %Seleccionar sitio de origen
            i = SeleccionPorRuleta(P);
            %Se elije k al azar, no igual a i
            K = [1:i-1 i+1:TamPoblacion];
            k = K(randi([1 numel(K)]));
            %Defina el coeficiente de aceleración
            phi = a*unifrnd(-1, +1, MatrizVar);
            %Nueva posición de abeja
            NuevaAbeja.Posicion = Poblacion(i).Posicion+phi.*(Poblacion(i).Posicion-Poblacion(k).Posicion);
            %Aplicar límites
            NuevaAbeja.Posicion = max(NuevaAbeja.Posicion, LimiteInferior);
            NuevaAbeja.Posicion = min(NuevaAbeja.Posicion, LimiteSuperior);
            %Evaluación
            NuevaAbeja.Costo = CostoFuncion(NuevaAbeja.Posicion);
            %Comparación
            if NuevaAbeja.Costo <= Poblacion(i).Costo
                Poblacion(i) = NuevaAbeja;
            else
                Contador(i) = Contador(i) + 1;
            end
        end
        %Abejas exploradoras
        for i = 1:TamPoblacion
            if Contador(i) >= L
                Poblacion(i).Posicion = unifrnd(LimiteInferior, LimiteSuperior, MatrizVar);
                Poblacion(i).Costo = CostoFuncion(Poblacion(i).Posicion);
                Contador(i) = 0;
            end
        end
        %Actualizar la mejor solución encontrada
        for i = 1:TamPoblacion
            if Poblacion(i).Costo <= MejorSolucion.Costo
                MejorSolucion = Poblacion(i);
            end
        end
        %Almacene el mejor costo encontrado
        MejorCosto(Iteracion) = MejorSolucion.Costo;
        %Mostrar información de iteración
        disp(['Generacion #' num2str(Iteracion) ', Mejor Solucion Encontrada = ' num2str(MejorCosto(Iteracion))]);
    end
        
    Resultado = MejorCosto;
end