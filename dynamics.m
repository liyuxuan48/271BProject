function [zhist,Xhist,Xehist,Xeaphist,rhist,q] = dynamics(trange,lambda,at,Khist,Phist,Ea_t2,Ev_t2,R1,R2,tf,F,G,V_c,dt)

    q = telegraph_noise(trange,lambda,tf,at);

    % initialize X0
    y0 = 0.0;
    v0 = sqrt(Ev_t2)*randn();
    a0 = sqrt(Ea_t2)*randn();
%     a0 = q(1);
    X0 = [y0;v0;a0];
    
    % Xehist
    Xehist = zeros(length(trange),3);
    Xetemp = Xehist(1,:)';
    
    % Xeaphist
    Xeaphist = zeros(length(trange),3);
    Xeaptemp = Xeaphist(1,:)';

    % Xhist
    Xhist = zeros(length(trange),3);
    Xhist(1,:) = X0;
    Xtemp = X0;


    zhist = zeros(length(trange),1);
    rhist = zeros(length(trange),1);

    n_hist_half = randn(length(trange),1);


    for i = 1:length(trange)
        t = trange(i);
        X = Xtemp;
        
%         noise
        n = sqrt(R1+R2/(tf-t)^2)./sqrt(dt).*n_hist_half(i);
        
%         measurement;
        H = [1./(V_c .* (tf - t)),0,0];
        zhist(i) = H*Xtemp + n;
       
                
        % estimation part
        Xe = Xetemp;
        Xeaptemp = Xe + F*Xe*dt;
        rhist(i) = (zhist(i)-H*Xeaptemp);
        Xetemp = Xeaptemp + Khist(i,:)'*(zhist(i)-H*Xeaptemp)*dt;

        Xehist(i,:) = Xetemp;
        Xeaphist(i,:) = Xeaptemp;
        
        % simulation part
        % generate brownian motion
        if i < length(trange)
            randomi = (randi([-1,0])+0.5)*2;
            
%             X(3)= q(i+1);
%             Xtemp = X + F*X*dt;
            
            Xtemp = X + F*X*dt + G*sqrt(Ea_t2)*randomi*sqrt(dt);
    

            
            Xhist(i+1,:) = Xtemp;
        end
        
   
    end
    zhist = zhist(1:end);
    Xhist = Xhist(1:end,:);
    Xehist = Xehist(1:end,:);
    
end