function OptionPrice = CoxRossRubinstein(K,S0,r,sig,dt,steps,Type,earlyExercise)
% Function to calculate the price of a European or American
% Put or Call option using a Cox-Ross-Rubinstein binomial tree.
%
% Inputs: K - strike
%       : S0 - initial price of the underlying asset
%       : r -  risk free interest rate
%       : sig - volatility
%       : dt - size of a time step
%       : steps - number of time steps to calculate
%       : Type - must be 'PUT' or 'CALL'.
%       : earlyExercise - true for American, false for European.
%
% Output: Price - the option price


% Calculate the Cox-Ross-Rubinstein model parameters
R = exp(r*dt);
u = exp(sig*sqrt(dt));
d = 1/u;
p = (R-d)/(u-d);

% Loop over each node and calculate the Cox-Ross-Rubinstein underlying 
% asset price tree
priceTree = nan(steps+1,steps+1);
priceTree(1,1) = S0;
for idx = 2:steps+1
    priceTree(1:idx-1,idx) = priceTree(1:idx-1,idx-1)*u;
    priceTree(idx,idx) = priceTree(idx-1,idx-1)*d;
end

% Calculate the value at expiry
valueTree = nan(size(priceTree));
switch Type
    case 'PUT'
        valueTree(:,end) = max(K-priceTree(:,end),0);
    case 'CALL'
        valueTree(:,end) = max(priceTree(:,end)-K,0);
end

% Loop backwards to get values at the earlier times
steps = size(priceTree,2)-1;
for idx = steps:-1:1
    valueTree(1:idx,idx) = ...
        exp(-r*dt)*(p*valueTree(1:idx,idx+1) ...
        + (1-p)*valueTree(2:idx+1,idx+1));
    if earlyExercise
        switch Type
            case 'PUT'
                valueTree(1:idx,idx) = ...
                    max(K-priceTree(1:idx,idx),valueTree(1:idx,idx));
            case 'CALL'
                valueTree(1:idx,idx) = ...
                    max(priceTree(1:idx,idx)-K,valueTree(1:idx,idx));
        end
    end
end

% Output the option price
OptionPrice = valueTree(1); 
end