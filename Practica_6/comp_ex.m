function [resultante] = comp_ex(matriz, max, min)
    [row,col] = size(matriz);
    [funMin, funMax] = bounds(matriz, "all");


    disp("funmin: " + funMin);disp("funmax: " + funMax);disp("max: " + max);disp("min: "+min)

    resultante = zeros(size(matriz));

    for i=1:row
        for j=1:col
            resultante(i,j) = ceil((((matriz(i,j) - funMin)/(funMax - funMin))*(max-min))+min);
            disp((((matriz(i,j) - funMin)/(funMax - funMin))*(max-min))+min);
        
        end
    end
end