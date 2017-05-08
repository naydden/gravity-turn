function T=thrust(mp,Isp) %Funcio que calcula l'empenta tant si tenim més d'un ISP com si no.
if (length(mp) ~= length(Isp)), error('Error: Matriu mp no coincideix amb matriu Isp'); end
T = sum(mp.*9.806.*Isp );    
end

