clc
close all

warning off all

a=imread("1.jpg");

%Introducimos el mapeo de puntos de cada zona
tabla=impixel(a);
% 5 datos por clase, por lo tanto 5 clases = 25 puntos


red = [182  183 186 198; 56 135 17 63; 44 37 69 16; 117 142 159 107; 210 115 209 201];
green = [208 213 212 214; 24 99 90 78; 37 46 17 37; 137 140 76 122; 187 98 126 186];
blue = [232 239 236 231; 17 56 49 59; 30 35 12 21; 17 30 2 25; 133 79 86 131];
unknow = [134 117 89];



media_rojo=mean(red');
media_rojo=media_rojo';

media_verde=mean(green');
media_verde=media_verde';

media_azul=mean(blue');
media_azul=media_azul';



plot3(red(1,:), red(2,:), red(3,:),'ro','MarkerSize',10,'MarkerFaceColor','r');
grid on
hold on
plot3(green(1,:), green(2,:), green(3,:),'ro','MarkerSize',10,'MarkerFaceColor','y');
plot3(blue(1,:), blue(2,:), blue(3,:),'ro','MarkerSize',10,'MarkerFaceColor','b');
plot3(unknow(1,1), unknow(1,2), unknow(1,3), 'X', 'MarkerSize',20,'MarkerFaceColor','black')

legend("sky", "follage", "stem", "grass", "DryGrass");

%Once the media are done, we can use then as points to see how close can we
%get

d1 = sqrt((unknow(1,1)-media_rojo(1,1))^2 + (unknow(1,2)-media_verde(1,1))^2 + (unknow(1,3)-media_azul(1,1))^2);
disp(d1)
d2 = sqrt((unknow(1,1)-media_rojo(2,1))^2 + (unknow(1,2)-media_verde(2,1))^2 + (unknow(1,3)-media_azul(2,1))^2);
disp(d2)
d3 = sqrt((unknow(1,1)-media_rojo(3,1))^2 + (unknow(1,2)-media_verde(3,1))^2 + (unknow(1,3)-media_azul(3,1))^2);
disp(d3)
d4 = sqrt((unknow(1,1)-media_rojo(4,1))^2 + (unknow(1,2)-media_verde(4,1))^2 + (unknow(1,3)-media_azul(4,1))^2);
disp(d4)
d5 = sqrt((unknow(1,1)-media_rojo(5,1))^2 + (unknow(1,2)-media_verde(5,1))^2 + (unknow(1,3)-media_azul(5,1))^2);
disp(d5)


distances = [d1 d2 d3 d4 d5];
[MIN, MAX] = bounds(distances);
disp(MIN);
 
switch MIN
    case d1
        disp("El punto pertenece al cielo")
    case d2
        disp("The point belongs to the follage")
    case d3
        disp("The point belongs to the tale")
    case d4
        disp("The point belongss to the grass")
    case d5
        disp("The point belongs to the ugly glass")
end




