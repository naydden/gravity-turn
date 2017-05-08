function g = gravity(h)
g0 =  9.80665;
g = (g0*(6371000/(6371000+h))^2);
end