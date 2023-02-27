close all all;


im1=imread("1.jpg"); %Leemos la imagen

rojo = im1;

%This might not be the best way to do it, but ill fix it when i get
%something better (y)
for i=1:400
rojo(:,i,1);
rojo(:,i,2)=0;
rojo(:,i,3)=0;
imshow(rojo)
end

for i=401:799
rojo(:,i,1)=0;
rojo(:,i,2);
rojo(:,i,3)=0;
imshow(rojo)
end

for i=799:1200
rojo(:,i,1)=0;
rojo(:,i,2)=0;
rojo(:,i,3);
imshow(rojo)
end



% blue = im1;
% 
% blue(:,400,1);
% blue(:,400,2)=0;
% blue(:,400,3)=0;
% imshow(blue)
% 
% green = im1;
% 
% green(:,800,1);
% green(:,800,2)=0;
% green(:,800,3)=0;
% 
% 
% imshow(green)
% %800 1200