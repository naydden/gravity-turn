% Autor: Boyan Naydenov
% Instructors: Manel Soria i Arnau Miro
% Gravity turn. Treball Sistemes Propulsius GRETA 2B 2014/2015

clear all; close all; clc
DATA = dataariane(1); %pren dades inicals del coet a treballar. Per veure les del Vega canviar totes les "dataariane" per "datavega". 
n=DATA.n; %agafa les etapes del coet per passar-ho al for
y0=[0 0 89.5*180/pi 0 0 0 DATA.m0];  %condicions inicials
dt=inf;%defineix maxim de interval
options = odeset('RelTol', 1e-8,...
                 'AbsTol', 1e-8,...
                 'Maxstep', dt);%,...
                %'Outputfcn', @OutputFcn);%Si bloquejem aquesta línia
                % la simulacio es fara mes rapidament
                
%crea figura abans de tindre resultats
scr = get(0,'ScreenSize');
F(1)=figure('Name','Simulacio del comportament d''un coet',...
                       'NumberTitle','off');
set_fig_position(F(1), 15,0 , 600, scr(3)*(1/3)); %fixa la figura segons la resolució de la pantalla

%crea eixos abans de tindre resultats
AX(1)= subplot(3,1,1,'nextplot','add');
xlabel(AX(1),'t (s)');
ylabel(AX(1),'y (km)');
title(AX(1),'Height');
AX(2)= subplot(3,1,2,'nextplot','add');
xlabel(AX(2),'t (s)');
ylabel(AX(2),'v (km/s)');
title(AX(2),'Velocity');
AX(3)= subplot(3,1,3,'nextplot','add');
xlabel(AX(3),'t (s)');
ylabel(AX(3),'x (km)');
title(AX(3),'Position');

for i = 1:n
DATA = dataariane(i); %d'aquesta manera els valors de DATA varien amb l'etapa
DATA.stage = i; DATA.F = F; DATA.AX = AX;
[ti,yi] = ode45(@myeq,[DATA.t0 DATA.t1],y0,options,DATA); %crido la funcio on tinc les EDOS per aplicar-li l'ODE45
%Guardo els valors en nova matriu
if i==1
    t=ti; y=yi;
else
    t=[t;ti]; y=[y;yi];
end
y0=yi(end,:);%Les condicions inicials son els resultats finlas de l'etapa anterior.
   
end

%Resultat Grafic
plot(AX(1),t,y(:,1).*10^-3);
plot(AX(2),t,y(:,2).*10^-3)
plot(AX(3),t,y(:,4).*10^-3)

F(2) = figure('Name','Variacio de l''angle de vol',...
                         'NumberTitle','off');
set_fig_position(F(2), 15, scr(3)*(1/3), 600, scr(3)*(1/3));

subplot(2,1,1);
plot(t,rad2deg(y(:,3)))
xlabel('t (s)');
ylabel('\gamma (deg)');
title('Flight angle');

subplot(2,1,2);
plot(y(:,1).*10^-3,rad2deg(y(:,3)))
xlabel('height (km)');
ylabel('\gamma (deg)');
title('Flight angle');

F(3) = figure('Name','Perdues per Drag i Gravetat en %',...
                         'NumberTitle','off');
set_fig_position(F(3), 15, scr(3)*(2/3), 600, scr(3)*(1/3));

subplot(2,1,1);
plot(y(:,1).*10^-3,-y(:,6)*1e-3)
xlabel('height (km)');
ylabel('Drag Loss (km/s)');

subplot(2,1,2);
plot(y(:,1).*10^-3,-y(:,5)*1e-3)
xlabel('height (km)');
ylabel('Gravity Loss (km/s)');