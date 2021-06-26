function [K, r_inf] = kuramoto_coupling(theta0, omega, tfinal, dt)

dK=0.2;
K=[0:dK:5];

for i = 1:length(K)
    
    [t, r]=kuramoto_ode(theta0,omega,K(i),tfinal,dt);
    
    r_inf(i) = r(length(r));
    
end



