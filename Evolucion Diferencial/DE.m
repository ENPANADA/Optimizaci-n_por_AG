function Resultado = DE(CostoFuncion,VarSize,LimiteInferior,LimiteSuperior,IteracionesMax,TamPoblacion,EscalaMin,EscalaMax,ProbabilidadCruce)
    
    %% Inicialización
    
    Individuo.Posicion = [];
    Individuo.Costo = [];
    
    MejorSolucion.Costo = inf;
    
    Poblacion = repmat(Individuo, TamPoblacion, 1);
    
    for especimen = 1:TamPoblacion
    
        Poblacion(especimen).Posicion = unifrnd(LimiteInferior, LimiteSuperior, VarSize);
        
        Poblacion(especimen).Costo = CostoFuncion(Poblacion(especimen).Posicion);
        
        if Poblacion(especimen).Costo<MejorSolucion.Costo
            MejorSolucion = Poblacion(especimen);
        end
        
    end
    
    MejorCosto = zeros(IteracionesMax, 1);
    
    %% Bucle principal
    
    for Generacion = 1:IteracionesMax
        
        for especimen = 1:TamPoblacion
            
            x = Poblacion(especimen).Posicion;
            
            IndividuoAleatorio = randperm(TamPoblacion);
            
            IndividuoAleatorio(IndividuoAleatorio == especimen) = [];
            
            Dato1 = IndividuoAleatorio(1);
            Dato2 = IndividuoAleatorio(2);
            Dato3 = IndividuoAleatorio(3);
            
            % Mutación
            %beta = unifrnd(EscalaMin, EscalaMax);
            beta = unifrnd(EscalaMin, EscalaMax, VarSize);
            y = Poblacion(Dato1).Posicion+beta.*(Poblacion(Dato2).Posicion-Poblacion(Dato3).Posicion);
            y = max(y, LimiteInferior);
		    y = min(y, LimiteSuperior);
		    
            % Cruce
            z = zeros(size(x));
            Elegido = randi([1 numel(x)]);
            for i = 1:numel(x)
                if i == Elegido || rand <= ProbabilidadCruce
                    z(i) = y(i);
                else
                    z(i) = x(i);
                end
            end
            
            NuevaSolucion.Posicion = z;
            NuevaSolucion.Costo = CostoFuncion(NuevaSolucion.Posicion);
            
            if NuevaSolucion.Costo<Poblacion(especimen).Costo
                Poblacion(especimen) = NuevaSolucion;
                
                if Poblacion(especimen).Costo<MejorSolucion.Costo
                   MejorSolucion = Poblacion(especimen);
                end
            end
            
        end
        
        % Actualizar mejor costo
        MejorCosto(Generacion) = MejorSolucion.Costo;
        
        % Mostrar información de iteración
        disp(['Generacion #' num2str(Generacion) ', Mejor Solucion Encontrada: ' num2str(MejorCosto(Generacion))]);
        
    end

    Resultado = MejorCosto;

end
