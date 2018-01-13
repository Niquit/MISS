clc;
clear;
clear all;

sim('lab3')
m=2;
l=3;
t=0.01;

for i=1:length(fi)
    plot(-l*sin(fi(i)), -l*cos(fi(i)), 'b', 'MarkerSize', 5*m);
    axis([-1.1*l 1.1*l -1.1*l 1.1*l])
    line([0 -l*sin(fi(i))],[0 -l*cos(fi(i))],'Color','r','LineWidth',2);
    pause(t);
end