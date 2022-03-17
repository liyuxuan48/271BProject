function [q] = telegraph_noise(trange,lambda,tf,at)

    N_tele = 1;


    deltaT = -log(rand(N_tele,1))/lambda;
    tele_switch = randi(2,[N_tele,1])-1;
    switch_deltaT = nonzeros(tele_switch .* deltaT);
    tseries = cumsum(switch_deltaT);
    while  isempty(tseries) || tseries(end) < tf
        deltaT = [deltaT, -log(rand(N_tele,1))/lambda];
        tele_switch = [tele_switch, randi(2,[N_tele,1])-1;];
        switch_deltaT = nonzeros(tele_switch .* deltaT);
        tseries = cumsum(switch_deltaT);
    end

    tseries_stack = [tseries,tseries + 1e-10]';
    t_interpolation = [0.0,tseries_stack(1:end-1)]';
    swtiches = 2*rem(1:length(tseries),2) - 1;
    swtiches_temp = [swtiches;swtiches];
    swtiches_interpolation = at .* 2*(randi(2)-1.5)*swtiches_temp(:);

    xp = trange;

    q = interp1(t_interpolation,swtiches_interpolation,trange);
end
