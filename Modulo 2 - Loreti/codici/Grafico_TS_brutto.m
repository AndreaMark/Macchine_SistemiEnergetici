clear all
close all
clc


T = linspace(0,800,200); % range of temperatures

figure; hold on

% SET DI ISOBARE
% we need to compute S-T for a range of pressures. Here
% for P = [0.01 0.1 1 5 30 100 250 500 1000] % bar
%     XSteam is not vectorized, so here is an easy way to compute a
%     vector of entropies
%     S = arrayfun(@(t) XSteam('s_PT',P,t),T);
%     plot(S,T,'k-')
%     text(S(end),T(end),sprintf('%1.1f bar',P),'rotation',90)
% end
% set(gca,'Position',[0.13 0.11 0.775 0.7])

% UNICA ISOBARA

P = 25; %bar
S = arrayfun(@(t) XSteam('s_PT',P,t),T);
plot(S,T,'k-')

% saturated vapor and liquid entropy lines
svap = arrayfun(@(t) XSteam('sV_T',t),T);
sliq = arrayfun(@(t) XSteam('sL_T',t),T);

plot(svap,T,'k-')
plot(sliq,T,'k-')
xlabel('Entropia (kJ/(kg K)')
ylabel('Temperatura (^\circC)')

% While the figure is still opened, we can use the matlab2tikz function. The basic command is:
 
% matlab2tikz('myfigure.tex');
 
% The first argument is the output filename. The result is saved to this file. Move the file to
% any place inside your LaTeX document to allow for including it.

%matlab2tikz('myfigure.tex')