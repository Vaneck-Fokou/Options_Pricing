function [ X ] = Bernouilli( p, val1, val2 )
%This function generate a bernouilli variable X
%X takes value val1 with probability p
%X takes value val2 with probability 1-p

U = rand; %Uniform random variable
X = val1 * (U<=p) + val2 * (p<U);

end

