clc %limpia pantalla
clear all all all% limpia todo
close all% cierra todo
warning off all

% COMO LEER Y DESPLEGAR IMAGENES EN PANTALLA
a=imread('tree.jpg');
[m,n]=size(a)
figure(1)
subplot(2,3,1)
imshow(a)
title('original')


% figure(2)
b=rgb2gray(a);
subplot(2,3,2)
imshow(b)
title('grises')
% 
% figure(3)
  c=im2bw(b);
 subplot(2,3,3)
 imshow(c)
 
% extrayendo caracteristicas de la imagen
roja=a;
roja(:,:,1);
roja(:,:,2)=0;
roja(:,:,3)=0;
subplot(2,3,4)
imshow(roja)

verde=a;
verde(:,:,1)=0;
verde(:,:,2);
verde(:,:,3)=0;
subplot(2,3,5)
imshow(verde)

azul=a;
azul(:,:,1)=0;
azul(:,:,2)=0;
azul(:,:,3);
subplot(2,3,6)
imshow(azul)

%% concatenado arreglos
figure(2)
arreglo=[a roja;verde azul];
imshow(arreglo)



%% PRACTICA 1
rows = m/3
colums = n/9
figure(3)
colums_part = a;
colums_part(:,1:colums,1);
colums_part(:,1:colums,2)=0;
colums_part(:,1:colums,3)=0;

colums_part(:,colums:colums*2,1)=0;
colums_part(:,colums:colums*2,2);
colums_part(:,colums:colums*2,3)=0;

colums_part(:,colums*2:end,1)=0;
colums_part(:,colums*2:end,2)=0;
colums_part(:,colums*2:end,3);


imshow(colums_part);

figure(4)
rows_part = a;
rows_part(1:rows,:,1);
rows_part(1:rows,:,2)=0;
rows_part(1:rows,:,3)=0;

rows_part(rows:rows*2,:,1)=0;
rows_part(rows:rows*2,:,2);
rows_part(rows:rows*2,:,3)=0;

rows_part(rows*2:end,:,1)=0;
rows_part(rows*2:end,:,2)=0;
rows_part(rows*2:end,:,3);

imshow(rows_part);

%%F

f = imread("F.jpg");


%blue
f(:,1:90,1) = 0;
f(:,1:90,2) = 0;
f(:,1:90,3);

%red
f(:,90:181,1);
f(:,90:181,2)=0;
f(:,90:181,3)=0;

%Green for the F
f(20:266,9:78,1)=124; 
f(20:266,9:78,2)=252;  
f(20:266,9:78,3)=0;  

f(20:72,78:176,1)=124; 
f(20:72,78:176,2)=252; 
f(20:72,78:176,3)=0; 

f(115:165,78:163,1)=124; 
f(115:165,78:163,2)=252;
f(115:165,78:163,3)=0; 

figure(6)
imshow(f)


disp('fin de proceso...')