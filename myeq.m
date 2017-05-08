%Sistema de edos
function dydt = myeq(t,y,DATA)

h = y(1); % y(1)= distancia coet a l'origen m
v = y(2); % y(2)= velocitat coet m/s 
th = y(3); % y(3)= angle del coet respecte de la horitzontal (angle de vol)
x = y(4); %y(4)= recorregut horitzontal en m
vG = y(5); % y(5)= perdues de velocitat degut a la gravetat 
vD = y(6); % y(6)= perdues de velocitat degut al Drag
m = y(7); % y(7) =  massa del coet

T=thrust(DATA.mp,DATA.Isp);
D = drag(h,v,DATA.cd,DATA.a); 

% equacions:
%hipotesis: 1)cohet no genera Lift. 2)Angle d'atac i angle de delfeccio del
% fluxe igual a 0. Solament tenim en compte angle de vol.
dydt = zeros(7,1);

%Ec deduides a clase pero completades amb velocitat de rotació de la Terra i l'efecte de la gravetat.
if h<DATA.h_gr
    dydt(1) = v;
    dydt(2) = T/m - D/m - gravity(h);
    dydt(3) = 0;
    dydt(4) = 0;
    dydt(5) = -gravity(h);
    dydt(6) = -D/m;
    dydt(7) = -sum(DATA.mp);
else
    dydt(1) = v*sin(th);
    dydt(2) = T/m - D/m -(gravity(h))*sin(th);
    dydt(3) = (-1/v)*((gravity(h))-(v*v)/(DATA.Re+h)*cos(th));
    dydt(4) = (DATA.Re)/(DATA.Re+h)*v*cos(th);
    dydt(5) = -gravity(h)*sin(th);
    dydt(6) = -D/m;
    dydt(7) = -sum(DATA.mp);
end

end