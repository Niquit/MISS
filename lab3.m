clc;
clear;
clear all;

sim('lab3')
m = str2num( get_param ('lab3/Subsystem', 'm' ) ) ;
l = str2num( get_param ('lab3/Subsystem', 'l' ) ) ;

t=0.01;

for i=1:length(fi)
    lr=l+r(i);
    lmax=l+max(r);
    hold off;
    plot(-lr*sin(fi(i)), -lr*cos(fi(i)), 'b.', 'MarkerSize', 20*m);
    axis([-1.1*lmax 1.1*lmax -1.1*lmax 1.1*lmax])
    %line([0 -lr*sin(fi(i))],[0 -lr*cos(fi(i))],'Color','r','LineWidth',2);
    hold on;
    [xs,ys] = spring(0,0,-lr*sin(fi(i)),-lr*cos(fi(i)),10,1,0.2);
    plot(xs,ys,'Color','r','LineWidth',2);
    pause(t);
end