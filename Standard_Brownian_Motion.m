% STANDARD BROWNIAN MOTION
% nbpas is the number of step
% T is the duration
% delta is the difference of time between two period

T = 100;
nbpas = 1000;
delta = T/nbpas; 


x = 0:delta:T;
y = zeros(1, nbpas+1);

for i = 2:nbpas+1
    y(1, i) = y(1, i-1) + sqrt(delta)*randn;
end

plot(x, y); 