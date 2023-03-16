close all all
warning off


a=imread("imagen.png");
[m,n]=size(a);


%Obtiene numeros aleatorios dada las medidas de la imagen
row = randi(size(a, 1), 50, 1);  
col = randi(size(a, 1), 50, 1);  




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
    desconocido=[ unknown(:,1)'; unknown(:,2)'; unknown(:,3)'];
    % Graficando los datos de las clases
    
    plot3(c1(1,:),c1(2,:),c1(3,:),'ko','MarkerSize',10,'MarkerFaceColor','c')
    hold on
    grid on
    plot3(c2(1,:),c2(2,:),c2(3,:),'ko','MarkerSize',10,'MarkerFaceColor','g')
    hold on
    plot3(c3(1,:),c3(2,:),c3(3,:),'ko','MarkerSize',10,'MarkerFaceColor','m')
    hold on
    plot3(unknown(:,1)',unknown(:,2)',112','ko','MarkerSize',10,'MarkerFaceColor','k')
    view(3);
    legend('c1', 'c2', 'c3', 'Punto')
    
%     plot3(desconocido(1,:),desconocido(2,:),desconocido(3,:),'ko','MarkerSize',10,'MarkerFaceColor','k')
%     legen('PUNTO')

    distance_c1 = ((average_c1(1,:)- desconocido(1,:))^2 + (average_c1(2,:)- desconocido(2,:))^2 + (average_c1(3,:)- desconocido(3,:))^2)^(1/2);
    distance_c2 = ((average_c2(1,:)- desconocido(1,:))^2 + (average_c2(2,:)- desconocido(2,:))^2 + (average_c2(3,:)- desconocido(3,:))^2)^(1/2);
    distance_c3 = ((average_c3(1,:)- desconocido(1,:))^2 + (average_c3(2,:)- desconocido(2,:))^2 + (average_c3(3,:)- desconocido(3,:))^2)^(1/2);
    disp("The unknown point, points at: ")
    if distance_c1 < distance_c2 & distance_c1 < distance_c3
        disp(">>>>>>>>>La clase 1     (☞ﾟヮﾟ)☞")
        disp(c1(:,1))
    elseif distance_c2 < distance_c1 & distance_c2 < distance_c3
        disp(">>>>>>>>>La clase 2     (⌐■_■)")
        disp(c2(:,1))
    else
        disp(">>>>>>>>>La clase 3        ╰(*°▽°*)╯")
        disp(c3(:,1))
    end
     
    continueHandler = input("Do you want to continue? [y/n]","s");
    grid off
    hold off
    close all
end
%Uncomment if want to see the points selected at the begining of the file

figure(2)
imshow(a);
axis on
hold on;
plot(row,col, '.', 'MarkerSize', 30, 'LineWidth', 2);


disp("fin del programa")