function rh=isab(h) %ISA 1976 model with Gravity Variation included
%g0 = 9.80665; %m/s^2
R =287; %m^2/s^2*k
if (h<11000) %Troposfera
        
            T=288.15-6.5/1000*h;
            rh=1.2252*(T/288.15)^(-gravity(h)/(-6.5*R)-1);
        
elseif(h>=11000 && h<20000) %Tropopausa
        
            T=216.65; %K
            rh=0.3640*exp((-gravity(h)/R*T)*(h-11000));
         
elseif(h>=20000 &&h<32000) %Estratosfera
    
            T=216.65+1/1000*(h-11000); %K
            rh=0.0881*(T/216.65)^(-gravity(h)/(1*R)-1);
         
elseif(h>=32000 && h<47000) %Estratosfera 2
     
            T=228.65+2.8/1000*(h-32000); %K
            rh=0.0132*(T/228.65)^(-gravity(h)/(2.8*R)-1);
         
elseif(h>=47000 && h<51000) %Estratopausa
     
            T=270.65; %?K
            rh=0.0014*exp((-gravity(h)/R*T)*(h-47000));
         
elseif(h>=51000 && h<71000) %Mesosfera
    
            T=270.65-2.8/1000*(h-51000); %K
            rh=0.0009*(T/270.65)^(-gravity(h)/(-2.8*R)-1);
         
elseif(h>=71000 && h<84852) %Mesosfera 2
     
            T=214.65-2/1000*(h-71000); %K
            rh=0.0001*(T/214.65)^(-gravity(h)/(-2*R)-1);
         
elseif(h>=84852 && h<100000) %Mesopausa
     
            T=186.87; %K
            rh=0.000001*exp((-gravity(h)/R*T)*(h-84852));
            
else % Model exponencial h>100 km
            rh = 1.2252*exp(-h/8.5e3);
end

end