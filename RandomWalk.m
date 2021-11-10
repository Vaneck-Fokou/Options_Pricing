function [ y ] = RandomWalk( pas, nbpas)
% This function simulate a random walk
%   nbpas is the number of step
%   pas is the value of a step
 
 x = 0:pas:nbpas;
 y = zeros(1, nbpas+1);
 
 for i = 2:nbpas+1
     y(1, i) = y(1, i-1) + Bernouilli(0.5, pas, -pas);
 end 
 
 plot(x, y);
 
end

