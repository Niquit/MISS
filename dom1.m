clear all;
clc;

% uruchomienie symulacji w Simulink'u
sim('dom1')

% Pobranie stałych wartości z Simulink'a
M1 = str2num(get_param('dom1/Subsystem', 'M1'));
M2 = str2num(get_param('dom1/Subsystem', 'M2'));
L1 = str2num(get_param('dom1/Subsystem', 'L1'));
L2 = str2num(get_param('dom1/Subsystem', 'L2'));

% Transponowanie macierzy
fi1=fi1';
fi2=fi2';

% Rysowanie
set(gcf, 'Position', get(0, 'Screensize'));

for i=1:length(fi1)
    hold off
    plot(L1*sin(fi1(i)),-L1*cos(fi1(i)), 'b', 'MarkerSize',M1*30,'Marker','.','LineWidth',2);
    hold on
    plot(L1*sin(fi1(i))+L2*sin(fi2(i)),-L1*cos(fi1(i))-L2*cos(fi2(i)), 'b', 'MarkerSize',M1*30,'Marker','.','LineWidth',2);
    hold on
    axis([-1.1*(L1+L2) 1.1*(L1+L2) -1.1*(L1+L2) 1.1*(L1+L2)]);
    line([0,L1*sin(fi1(i)),L1*sin(fi1(i))+L2*sin(fi2(i))], [0,-L1*cos(fi1(i)),-L1*cos(fi1(i))-L2*cos(fi2(i))],'Color','r','LineWidth',2);
    pause(0.01);
end