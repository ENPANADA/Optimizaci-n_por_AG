function Resultado = OAIS(f, N, max_iter, p_c, beta, p_m, sigma)
    % Inicialización
    x = linspace(-20, 20, 10000); % rango para la gráfica
    pop = 20*rand(1, N) - 10; % población inicial de anticuerpos
    fitness = f(pop); % evaluación de la población inicial
    best_fitness = zeros(max_iter, 1); % mejor fitness encontrado en cada iteración
    best_solution = zeros(max_iter, 1); % mejor solución encontrada en cada iteración
    MejorGlobal = 10000;
    
    % Iteraciones del algoritmo
    for iter = 1:max_iter
        % Selección
        [~, idx] = sort(fitness, 'descend');
        pop_sel = pop(idx(1:N/2));
        fitness_sel = fitness(idx(1:N/2));
        
        % Clonación
        n_clones = round(p_c*N);
        clones = repmat(pop_sel, [1, n_clones]);
        clones = clones + normrnd(0, sigma, size(clones));
        
        % Hipermutación
        mask = rand(size(clones)) < p_m;
        clones(mask) = clones(mask) + randn(size(clones(mask))) * sigma;
        
        % Evaluación de los clones
        fitness_clones = f(clones);
        
        % Selección de los mejores clones
        [~, idx] = sort(fitness_clones, 'descend');
        pop_new = clones(idx(1:N));
        fitness_new = fitness_clones(idx(1:N));
        
        % Actualización de la población
        pop = pop_new;
        fitness = fitness_new;
        
        % Registro de la mejor solución encontrada en esta iteración
        [best_fitness(iter), idx] = max(fitness);
        if pop(idx)<MejorGlobal
            MejorGlobal = pop(idx);
           
        end
        best_solution(iter) = MejorGlobal;
        disp(['Generacion #' num2str(iter) ', Mejor Solucion Encontrada = ' num2str(best_solution(iter))]);
    end
    Resultado = best_solution;
end