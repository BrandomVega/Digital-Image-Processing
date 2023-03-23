function compresion(img)
[Vmin, Vmax] = bounds(img, "all");
max = input("Que valor maximo quieres: ");
min = input("Que valor min quieres: ");
for i=Vmin:Vmax
    y(i) = (((i - Vmin)/(Vmax-Vmin))*(max-min))+min;
end
disp(y);
end