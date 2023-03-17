function MejorSolucionEncontrada = PSO(CostoFuncion,VarSize,VarMin,VarMax,MaxGeneraciones,nPop,w,wdamp,c1,c2)       

    % Límites de velocidad
    VelMax = 0.1*(VarMax-VarMin);
    VelMin = -VelMax;
    
    %% Inicialización
    
    InicializarParticula.Posicion = [];
    InicializarParticula.Costo = [];
    InicializarParticula.Velocidad = [];
    InicializarParticula.Mejor.Posicion = [];
    InicializarParticula.Mejor.Costo = [];
    particula = repmat(InicializarParticula, nPop, 1);
    MejorGlobal.Costo = inf;
    
    for i = 1:nPop
        % Inicializar posición
        particula(i).Posicion = unifrnd(VarMin, VarMax, VarSize);
        % Inicializar velocidad
        particula(i).Velocidad = zeros(VarSize);
        % Evaluación
        particula(i).Costo = CostoFuncion(particula(i).Posicion);
        % Actualizar mejor marca personal
        particula(i).Mejor.Posicion = particula(i).Posicion;
        particula(i).Mejor.Costo = particula(i).Costo;
        % Actualizar mejor global
        if particula(i).Mejor.Costo<MejorGlobal.Costo
            MejorGlobal = particula(i).Mejor;    
        end
    end
    
    MejorSolucionEncontrada = zeros(MaxGeneraciones, 1);
    
    %% PSO Bucle principal
    
    for generacion = 1:MaxGeneraciones
        for i = 1:nPop
            % Velocidad de actualización
            particula(i).Velocidad = w*particula(i).Velocidad ...
                +c1*rand(VarSize).*(particula(i).Mejor.Posicion-particula(i).Posicion) ...
                +c2*rand(VarSize).*(MejorGlobal.Posicion-particula(i).Posicion);
            % Aplicar límites de velocidad
            particula(i).Velocidad = max(particula(i).Velocidad, VelMin);
            particula(i).Velocidad = min(particula(i).Velocidad, VelMax);
            % Actualizar posición
            particula(i).Posicion = particula(i).Posicion + particula(i).Velocidad;
            % Efecto de espejo de velocidad
            IsOutside = (particula(i).Posicion<VarMin | particula(i).Posicion>VarMax);
            particula(i).Velocidad(IsOutside) = -particula(i).Velocidad(IsOutside);
            % Aplicar límites de posición
            particula(i).Posicion = max(particula(i).Posicion, VarMin);
            particula(i).Posicion = min(particula(i).Posicion, VarMax);
            % Evaluación
            particula(i).Costo = CostoFuncion(particula(i).Posicion);
            % Actualizar mejor marca personal
            if particula(i).Costo<particula(i).Mejor.Costo
                particula(i).Mejor.Posicion = particula(i).Posicion;
                particula(i).Mejor.Costo = particula(i).Costo;
                % Actualizar mejor global
                if particula(i).Mejor.Costo<MejorGlobal.Costo
                    MejorGlobal = particula(i).Mejor;
                end
            end
        end
        MejorSolucionEncontrada(generacion) = MejorGlobal.Costo;
        disp(['Generacion #' num2str(generacion) ', Mejor Solucion Encontrada = ' num2str(MejorSolucionEncontrada(generacion))]);
        w = w*wdamp;
    end
end