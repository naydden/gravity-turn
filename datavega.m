function DATA = datavega(stage)

%Vega
DATA.a = pi*(2.6/2)^2; %Seccio transversal
DATA.cd = 0.5; %Ceoficent de friccio
DATA.mpl = 490; %PAYLOAD
DATA.h_gr = 200; %metres des dels que comença gravity turn aproximadament
DATA.lat=0.090879; %Coordenada KOurou (radians)
DATA.az=pi/2; %Azimuth de llançament (respecte del nord)
DATA.We=7.2*10^-5; %Velocitat angular Terra
DATA.Re=6371000; %Radi Terra
DATA.n=4; %n. d'etapes

switch stage
    case 1
        DATA.t0 = 0; %s
        DATA.t1 = 106.8; %s
        DATA.Isp = 280;  % Impuls especific 1/s 
        DATA.comb =88365; % combustible
        DATA.m0=95796+DATA.mpl+25761+10948+968; %tot menys payload
        DATA.mp=DATA.comb/DATA.t1; % caudal màssic (kg/s)
    case 2 
        DATA.t0 = 106.8; %s
        DATA.t1 = DATA.t0+71.7; %s
        DATA.Isp = 289;  % Impuls especific 1/s 
        DATA.comb =23906; % combustible
        DATA.m0=DATA.mpl+25761+10948+968; %tot menys payload
        DATA.mp=DATA.comb/(DATA.t1-DATA.t0); % caudal màssic (kg/s)
    case 3
        DATA.t0 = 106.8+71.7; %s
        DATA.t1 = DATA.t0+109.6; %s
        DATA.Isp = 295;  % Impuls especific 1/s 
        DATA.comb =10115; % combustible
        DATA.m0=DATA.mpl+10948+968; %tot menys payload
        DATA.mp=DATA.comb/(DATA.t1-DATA.t0); % caudal màssic (kg/s)
    case 4
        DATA.t0 = 106.8+71.7+109.6; %s
        DATA.t1 = DATA.t0+667; %s
        DATA.Isp = 315.5;  % Impuls especific 1/s 
        DATA.comb =550; % combustible
        DATA.m0=DATA.mpl+968; %tot menys payload
        DATA.mp=DATA.comb/(DATA.t1-DATA.t0);% caudal màssic (kg/s)
    otherwise
        error('Stage %d not known!',stage);
end

end