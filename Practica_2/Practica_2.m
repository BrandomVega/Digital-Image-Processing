clc
close all
clear all
warning off all

a=imread("1.jpg");


tabla=impixel(a);


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

for i=1:5
    distances = sqrt((unknow(1,1)-media_rojo(i,1))^2 + (unknow(1,2)-media_verde(i,1))^2 + (unknow(1,3)-media_azul(i,1))^2);
end

[MIN, MAX] = bounds(distances);
disp(MIN);
 
switch MIN
    case distances(1)
        disp("The point belongs to the sky")
    case distances(2)
        disp("The point belongs to the follage")
    case distances(3)
        disp("The point belongs to the tale")
    case distances(4)
        disp("The point belongss to the grass")
    case distances(5)
        disp("The point belongs to the ugly glass")
end








