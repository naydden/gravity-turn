function stop = OutputFcn(t,var,flag,extras)
stop=false;

if isempty(flag)
    AX = extras.AX;

    plot(AX(1),t(end),var(1,end).*10^-3,'.');
    plot(AX(2),t(end),var(2,end).*10^-3,'.');
    plot(AX(3),t(end),var(4,end).*10^-3,'.');
    drawnow; % si auqesta funcio l'activem al main(GravityTurn1) es produeixen els càlculs en temps real.
end
end