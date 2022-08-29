function [sum, difference, product, quotient] = arith_ops(n1, n2)
%ARITH_OPS Returns the sum, difference, product, and quotient
% of two numbers
%   Inputs:
%       n1 [number]: first number
%       n2 [number]: second number
    sum = n1 + n2;
    difference = n1 - n2;
    product = n1 * n2;
    quotient = n1 / n2;
end
