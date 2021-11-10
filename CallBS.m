function C=CallBS(S0,K,T,r,sigma)
%Function computing the price of an european call option using
%Black-Scholes formula
%
%Inputs: S0 - Initial price of the underlying asset
%        K - Strike price of the option
%        T - Maturity of the option
%
%Output: C

%Computation of d1 and d2
d1=(log(S0/K)+r*T)/(sigma*sqrt(T))+sigma*sqrt(T)/2;
d2=d1-sigma*sqrt(T);

%Computation of the call's price
C=S0*normcdf(d1)-K*exp(-r*T)*normcdf(d2);
end