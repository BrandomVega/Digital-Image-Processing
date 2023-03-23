clc
close all
warning off

a = imread("img.jpg");
imshow(a);
red=a;
red(:,:,1);
red(:,:,2)=0;
red(:,:,3)=0;

green=a;
green(:,:,1)=0;
green(:,:,2);
green(:,:,3)=0;

blue=a;
blue(:,:,1)=0;
blue(:,:,2)=0;
blue(:,:,3);


red = rgb2gray(red);
green = rgb2gray(green);
blue = rgb2gray(blue);


% [counts,binLocations] = imhist(red);
% table = [counts,binLocations];
% disp(table);
% imhist(red);
% 



[Vmin, Vmax] = bounds(red, "all");
min = input("Que valor min quieres: ");
max = input("Que valor maximo quieres: ");
y = zeros(Vmax+1,1);

for i=Vmin:Vmax
    y(i+1) = (((i-Vmin)/(Vmax-Vmin))*(max-min)) + min;
    disp(y(i+1) + " " + i)
end

    

% 
% figure(1);
% subplot(2,3,1)
% imshow(red)
% subplot(2,3,2)
% imshow(green)
% subplot(2,3,3)
% imshow(blue)
% subplot(2,3,4)
% imhist(red);
% subplot(2,3,5)
% imhist(green);
% subplot(2,3,6)
% imhist(blue);






