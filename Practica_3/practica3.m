% AUTHORS
%     TUD 
%     PHIL
%     EMI
% 

% It might find wrong values, if its a 3 class image, it might get 4 
%     rgb pixels. Some solutions are: delete the image, run and put the image
%     again; or simply just run the program again

close all all
warning off


a=imread("imagen.png");
[m,n]=size(a);

puntos = input("Cuanta precision quieres: Soy neurotico ponle toda(1), media(2), no me importa(3): ","s");
switch puntos
    case "1"
        precision = 100;
    case "2"
        precision = 30;
    case "3"
        precision = 15;
end

%Obtiene numeros aleatorios dada las medidas de la imagen
row = randi(size(a, 1), precision, 1);  
col = randi(size(a, 1), precision, 1);  




table = [row, col];
%disp(table);
[tablaDim, columnas]= size(table);


%Split components with every row and col
redValue = zeros(tablaDim, 1);
greenValue = zeros(tablaDim, 1);
blueValue = zeros(tablaDim, 1);
for i=1:tablaDim
    redValue(i) = a(row(i), col(i), 1);
    greenValue(i) = a(row(i), col(i), 2);
    blueValue(i) = a(row(i), col(i), 3);
end

tablaRGB = [redValue,greenValue,blueValue];

%Default instruction sort the values from minor to mayor
r = unique(redValue, "stable");
g = unique(greenValue, "stable");
b = unique(blueValue, "stable");
rgb = [r, g, b];


%count the number of same pixels identified
c = zeros(3,1);
for i=1:tablaDim
    actualPosition = tablaRGB(i,:);
 
    if(actualPosition == rgb(1,:))
        c(1) = 1+c(1);
    end
    if(actualPosition == rgb(2,:))
        c(2) = 1+c(2);
    end
    if(actualPosition == rgb(3,:))
        c(3) = 1+c(3);
    end
end
% disp(tablaRGB);
%  disp(c);
% disp(rgb);

%Create every class
c1 = zeros(3,c(1));
c2 = zeros(3,c(2));
c3 = zeros(3,c(3));

%Fill classes with rgb array
for i=1:c(1)
    c1(:,i) = rgb(1,:)';
    c1(:,i) = rgb(1,:)';
    c1(:,i) = rgb(1,:)';
end
for i=1:c(2)
    c2(:,i) = rgb(2,:)';
    c2(:,i) = rgb(2,:)';
    c2(:,i) = rgb(2,:)';
end
for i=1:c(3)
    c3(:,i) = rgb(3,:)';
    c3(:,i) = rgb(3,:)';
    c3(:,i) = rgb(3,:)';
end
% disp(c1);
% disp(c2);
% disp(c3);


average_c1=mean(c1');
average_c1=average_c1';

average_c2=mean(c2');
average_c2=average_c2';

average_c3=mean(c3');
average_c3=average_c3';


continueHandler = "y";
while continueHandler == "y"
    [x,y,unknown]=impixel(a);
   
    % Graficando los datos de las clases
    %plot3(c1(1,:),c1(2,:),c1(3,:),'ro','MarkerSize',10,'MarkerFaceColor','r')
    grid on
    hold on
    %plot3(c2(1,:),c2(2,:),c2(3,:),'bo','MarkerSize',10,'MarkerFaceColor','b')
    %plot3(c3(1,:),c3(2,:),c3(3,:),'yo','MarkerSize',10,'MarkerFaceColor','y')
    %legend('NEGRO', 'ROJO', 'AMARILLO','PUNTO')
    desconocido=[ unknown(:,1)'; unknown(:,2)'; unknown(:,3)'];
    %plot3(desconocido(1,:),desconocido(2,:),desconocido(3,:),'ko','MarkerSize',10,'MarkerFaceColor','k')

    distance_c1 = ((average_c1(1,:)- desconocido(1,:))^2 + (average_c1(2,:)- desconocido(2,:))^2 + (average_c1(3,:)- desconocido(3,:))^2)^(1/2);
    distance_c2 = ((average_c2(1,:)- desconocido(1,:))^2 + (average_c2(2,:)- desconocido(2,:))^2 + (average_c2(3,:)- desconocido(3,:))^2)^(1/2);
    distance_c3 = ((average_c3(1,:)- desconocido(1,:))^2 + (average_c3(2,:)- desconocido(2,:))^2 + (average_c3(3,:)- desconocido(3,:))^2)^(1/2);
    disp("The unknown point, points at: ")
    if distance_c1 < distance_c2 & distance_c1 < distance_c3
        disp(">>>>>>>>>La clase 1     (☞ﾟヮﾟ)☞")
    elseif distance_c2 < distance_c1 & distance_c2 < distance_c3
        disp(">>>>>>>>>La clase 2     (⌐■_■)")
    else
        disp(">>>>>>>>>La clase 3        ╰(*°▽°*)╯")
    end
     
    continueHandler = input("Do you want to continue? [y/n]","s");
    grid off
    hold off
    close all
end
%Uncomment if want to see the points selected at the begining of the file

% figure(2)
% imshow(a);
% axis on
% hold on;
% plot(row,col, '.', 'MarkerSize', 30, 'LineWidth', 2);


disp("fin del programa")