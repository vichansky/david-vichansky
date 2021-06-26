function [t,r] = kuramoto_ode(theta0, omega, K, tfinal, dt)

%%Initial conditions
Nstep = round(tfinal/dt);

theta = theta0;


for k = 1:Nstep
   
    R_cos = mean(cos(theta));
    R_sin = mean(sin(theta));
    
    R = sqrt(R_cos^2 + R_sin^2);
    
    cosPsi = R_cos/(R + 1e-16);
    
    sinPsi = R_sin/(R + 1e-16);
    
    theta_new = theta + dt*(omega + K*R*(sinPsi*cos(theta) - cosPsi*sin(theta)));
    
    theta = theta_new;
    r(k)=R;
    
end

R_cos = mean(cos(theta)); 
R_sin = mean(sin(theta));   
r(Nstep+1) = sqrt(R_cos^2 + R_sin^2);
t=dt*[1:Nstep+1]';

