function P=PutBS(S0,K,T,r,sigma)
%Function computing the price of an european put option using
%Black-Scholes formula
%
%Inputs: S0 - Underlying asset initial price
%        K - Option’s strike price
%        T - Option’s maturity
%
%Output: P - Option price

%Computation of d1 and d2
d1=(log(S0/K)+(r-div)*T)/(sigma*sqrt(T))+sigma*sqrt(T)/2;
d2=d1-sigma*sqrt(T);

%Computation of the put's price
P=K*exp(-r*T)*normcdf(-d2)-S0*normcdf(-d1);
end