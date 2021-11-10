% MONTE CARLO SIMULATION FOR EUROPEAN OPTIONS PRICING
% T is the maturity
% St is the price of the asset at the time t
% nbMC is the number of simulation of the price ST
% N is the number of discretisation
% deltaT is the step
% So is the price at t = 0
% K is the strike 
% sig = volatility
% r is the risk free rate

So = 40;
K = 45;
sig = 0.3;
r = 0.2;
T = 1;
nbMC = 1000;
N = 1000;

deltaT = T/N;
FST = zeros(1,nbMC);
% price ST simulation
for j = 1:nbMC
    St = So;
    for t = 0:deltaT:T
    St = St * exp((r-(sig^2)/2)*deltaT + sig*sqrt(deltaT)*randn);
    end
FST(1,j) = max(St-K, 0)*exp(-r*T);
end
call = mean(FST);
put = call-So + K*exp(-r*T); 
plot(1:nbMC, FST)
% 95% Confidence interval and precision
varSt = var(FST);
% Call
bornInfCall = call-1.96*sqrt(varSt/nbMC);
bornSupCall = call+1.96*sqrt(varSt/nbMC);
% Put
bornInfPut = put-1.96*sqrt(varSt/nbMC);
bornSupPut = put+1.96*sqrt(varSt/nbMC);
% Convergence velocity


% Display the result
%sprintf('call = %g and put = %g', call, put)
sprintf('The price of the call option is %g \n and the confidence interval is: [%g, %g].', call, bornInfCall, bornSupCall)
sprintf('The price of the put option is %g \n and the confidence interval is: [%g, %g].', put, bornInfPut, bornSupPut)
