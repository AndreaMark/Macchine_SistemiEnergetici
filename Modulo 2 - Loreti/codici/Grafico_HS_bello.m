clear all
close all
clc
tic

%% Range di pressioni per inizializzare i parametri delle CLI e CLS
p = 0.01:0.01:400;
for i = 1:length(p)
    T(i) = XSteam('Tsat_p',p(i)); 
    sf(i) = XSteam('sL_T',p(i));
    sg(i) = XSteam('sv_T',p(i));
    hf(i) = XSteam('hl_T',p(i));
    hg(i) = XSteam('hv_T',p(i));
end
%% Isotermobarica TS
 P = 16; T = 560; %bar
 S = XSteam('sL_p',P); hLIM = 5000;

%% PLOT HS
figure(1)
hold on
% CLI CLS
plot(sf, hf,'k','linewidth',2)
plot(sg, hg,'k','linewidth',2)
%Plot Isotermobarica 
h1 = XSteam('h_ps', P, S); % Entalpia specifica in funzione di pressione e temperatura 
h1_1 = XSteam('hV_p',P); % Entalpia di vapore saturo alla pressione fornita
hc = linspace(h1,h1_1,100); % Entalpie da 1 a CLS
for k = 1:length(hc);
    sch(k) = XSteam('s_ph',P,hc(k));
end
plot(sch,hc,'r','linewidth',2)

 hold on
 hc2 = linspace(h1_1,hLIM,100); % Entalpie da CLS ad un punto deciso a priori
 for j = 1:length(hc2)
     sch2(j) = XSteam('s_ph',P,hc2(j));
 end
 plot(sch2, hc2, 'r', 'linewidth',2)
 xlabel('Entropia (kJ/(kg K)')
 ylabel('Entalpia (kJ/kg)')

toc
%% Latexizzazione
% While the figure is still opened, we can use the matlab2tikz function. The basic command is:
 
% matlab2tikz('myfigure.tex');
 
% The first argument is the output filename. The result is saved to this file. Move the file to
% any place inside your LaTeX document to allow for including it.

%matlab2tikz('myfigure.tex')