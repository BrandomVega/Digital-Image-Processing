
clc
clear all 
close all
warning off all 

h=imread("imagen.jpg");
[m,n]=size(h);
dato=imref2d(size(h));
imshow(h,dato)


 %Le pedimos al usuario cuántos puntos quiere por cada clase
 numPuntos = input("Número de puntos por clase:");

 %generando las clases con los números aleatorios
  cTreeX = randi([200,700],1,numPuntos);
  cTreeY = randi([100,200],1,numPuntos);

  cSkyX = randi([50,500],1,numPuntos);
  cSkyY = randi([1,100],1,numPuntos);

  cLakeX= randi([100,600],1,numPuntos);
  cLakeY = randi([200,300],1,numPuntos);

 
   
  %Usuario digita el punto a calcular 
disp('.....DIGITE LAS COORDENADAS DEL PUNTO  A CLASIFICAR....')
px=input('Coordenada en X:');
py=input('Coordenada en Y:');
desconocido=[px py];



 %Guarda los RGB de los puntos identificadoresy los muestra sobre la imagen
%  %con el plano 
z1=impixel(h,cSkyX(1,:),cSkyY(1,:));
z2=impixel(h,cLakeX(1,:),cLakeY(1,:));
z3=impixel(h,cTreeX(1,:),cTreeY(1,:));
z4=impixel(h,desconocido(1,1),desconocido(1,2));
%  
%  %graficando sobre la imagen:
 
 imshow(h,dato)
 hold on 
 grid on
 plot(cSkyX(1,:),cSkyY(1,:),'oc','Markersize',5,'MarkerFaceColor','c')
 plot(cLakeX(1,:),cLakeY(1,:),'ob','Markersize',5,'MarkerFaceColor','b')
 plot(cTreeX(1,:),cTreeY(1,:),'og','Markersize',5,'MarkerFaceColor','g')
 plot(px,py,'ok','Markersize',11,'MarkerFaceColor','w')
 legend('sky', 'lake', 'trees','unknow')

%Media de cada clase segun el RGB
media_sky=mean(z1);
media_lake=mean(z2);
media_tree=mean(z3); 


%Calcula la distancia entre el punto desconcido y los puntos de la clase
dp1=sqrt((z4(1,1)-media_sky(1,1))^2 + (z4(1,2)-media_sky(1,2))^2 + (z4(1,3)-media_sky(1,3))^2);
dp2=sqrt((z4(1,1)-media_lake(1,1))^2 + (z4(1,2)-media_lake(1,2))^2 + (z4(1,3)-media_lake(1,3))^2);
dp3=sqrt((z4(1,1)-media_tree(1,1))^2 + (z4(1,2)-media_tree(1,2))^2 + (z4(1,3)-media_tree(1,3))^2);

% %Los pone en un arreglo y calcula el MIN 
A=[dp1 dp2 dp3];
M=min(A);

%Muestra con el MIN a que clase depende el punto desconocido
if  M == dp1
     disp('El punto pertenece a la clase CIELO') 
elseif M == dp2
     disp('El punto pertenece a la clase LAGO')
elseif M == dp3
     disp( 'El punto pertenece a la clase ARBOLES')
end

disp("Fin del Programa")