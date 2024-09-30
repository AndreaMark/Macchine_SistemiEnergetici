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
 P = 25;  T = 100; sLIM = 7.5; %bar; %gradC

%% PLOT TS
figure(1)
hold on
% CLI CLS
plot(sf,p,'k','linewidth',2)
plot(sg,p,'k','linewidth',2)
%Plot Isotermobarica 
s1 = XSteam('s_pT', P, T); % Entropia specifica in funzione di pressione e temperatura 
s1_1 = XSteam('sV_p',P); % Entropia di vapore saturo alla pressione fornita
sb1 = linspace(s1,s1_1,500); % Entropie da 1 alla CLS
for l = 1:length(sb1)
    Tc1(l) = XSteam('T_ps',P,sb1(l));
end
plot(sb1, Tc1, 'r', 'linewidth',2)
sb2 = linspace(s1_1,sLIM,500); % Entropie da CLS ad un punto deciso a priori
for j = 1:length(sb2)
    Tc2(j) = XSteam('T_ps',P,sb2(j));
end
plot(sb2, Tc2, 'r', 'linewidth',2)
xlabel('Entropia (kJ/(kg K)')
ylabel('Temperatura (^\circC)')

toc

%% Latexizzazione
% While the figure is still opened, we can use the matlab2tikz function. The basic command is:
 
% matlab2tikz('myfigure.tex');
 
% The first argument is the output filename. The result is saved to this file. Move the file to
% any place inside your LaTeX document to allow for including it.

%matlab2tikz('myfigure.tex')