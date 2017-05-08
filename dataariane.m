function DATA = dataariane(stage)

%Ariane 5G
DATA.a = pi*(5.46/2)^2; %Seccio transversal
DATA.cd = 0.5; %Ceoficent de friccio
DATA.mpl = 7700; %PAYLOAD
DATA.h_gr = 200; %metres des dels que comença gravity turn (Valor aproximat)
DATA.lat=0.090879; %Coordenada KOurou (radians)
DATA.az=pi/2; %Azimuth de llançament (respecte del nord)
DATA.We=7.2*10^-5; %Velocitat angular Terra
DATA.Re=6371000; %Radi Terra
DATA.n=3; %n. d'etapes

switch stage
    case 1
        DATA.t0 = 0; %s
        DATA.t1 = 129; %s
        DATA.Isp = [275 275 430];  % Impuls especific 1/s 
        DATA.comb =[237700 237700 34626.18]; % combustible boosters i una part del core 1
        DATA.m0=DATA.mpl+277500*2+170800+12500; %tot menys payload
        DATA.mp=DATA.comb./DATA.t1; %cuadal massic
    case 2 
        DATA.t0 = 129; %s
        DATA.t1 = DATA.t0+460; %s
        DATA.Isp = 430;  % Impuls especific 1/s 
        DATA.comb =123473.82; % combustible
        DATA.m0=DATA.mpl+170800+12500; %tot menys payload
        DATA.mp=DATA.comb/(DATA.t1-DATA.t0); %cuadal massic
    case 3
        DATA.t0 = 129+460; %s
        DATA.t1 = DATA.t0+1100; %s
        DATA.Isp = 324;  % Impuls especific 1/s 
        DATA.comb =9800; % combustible
        DATA.m0=DATA.mpl+12500; %tot menys payload
        DATA.mp=DATA.comb/(DATA.t1-DATA.t0); %cuadal massic
    otherwise
        error('Stage %d not known!',stage);
end

end