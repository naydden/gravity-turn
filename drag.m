function D = drag(h,v,cd,a)
rh = isab(h); %el drag depen de la densitat que es calcula amb la Isa.
D=0.5*(v^2)*rh*cd*a;
end