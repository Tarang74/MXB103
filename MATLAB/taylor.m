function c = taylor( f, x0, n )
%TAYLOR Taylor polynomial
%   c = taylor(f, x0, n) returns the coefficients of the Taylor polynomial
%   of degree n for the function f, centred on x0

c = zeros(1,n+1);

for i = 0:n
    c(n+1-i) = f(x0) / factorial(i);  % compute ith coefficient f^(i)(x0) / i!
    f = derivative(f);                % replace f with its derivative
end

end