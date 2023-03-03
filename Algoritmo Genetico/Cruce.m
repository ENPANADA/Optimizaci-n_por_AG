function [hijo1,hijo2] = Cruce(Padre1,Padre2,explorar)
   
   parametro_de_cruce = unifrnd(-explorar, 1+explorar, size(Padre1));
   hijo1 = parametro_de_cruce.*Padre1 + (1-parametro_de_cruce).*Padre2;
   hijo2 = parametro_de_cruce.*Padre2 + (1-parametro_de_cruce).*Padre1; 
  
end