function [Khist,Phist] = KF_KP(trange,P0,Hbar,W,R1,R2,tf,F,V_c,dt)

    % Phist
    Phist = zeros(length(trange),3,3);
    Phist(1,:,:) = P0;
    Ptemp = P0;

    % Khist
    Khist = zeros(length(trange),3);

    

    for i = 1:length(trange)
        
        t = trange(i);
        
        %  kalman filter part
        P = Ptemp;
        dPdt = F*P + P*transpose(F) - 1/(V_c^2 * R1 * (tf-t)^2 + V_c^2 * R2)*P*transpose(Hbar)*Hbar*P + W;
        Ptemp = P + dPdt*dt;
        Phist(i+1,:,:) = Ptemp;

        denom = (V_c*R1*(tf-t) + V_c*R2/(tf-t));
        Khist(i,1) = Phist(i,1,1)/denom;
        Khist(i,2) = Phist(i,1,2)/denom;
        Khist(i,3) = Phist(i,1,3)/denom;
        
    end
% 
%     Khist = Khist(1:end-1,:);
    Phist = Phist(1:end-1,:,:);
    
end