clc;
clear;
clear all;

sim('lab2')
R = str2num(get_param('lab2/Subsystem','R'));
RS=0.2;
t=0.01;

for i=1:length(x)
    plot(0,0);
    axis([-10,10,-10,10]);
    rectangle('Position',[-R -R, 2*R,2*R], 'Curvature', [1 1]);
    hold on;
    rectangle('Position',[x(i)-RS, y(i)-RS, 2*RS, 2*RS], 'Curvature', [1 1]);
    hold off;
    pause(t);
end
