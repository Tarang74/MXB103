function [t, w, h] = euler_method(f, a, b, alpha, n)
%Euler_method Euler's method
% [t, w, h] = euler_method(f, a, b, alpha, n) performs Euler's method for
% solving the IVP y' = f(t,y) with initial condition y(a) = alpha
% taking n steps from t = a to t = b.

    % calculate h
    h = (b - a) / n;

    % create t array
    t = a:h:b;
    
    % initialise w array
    w = zeros(size(t));
    w(1) = alpha;
    
    % perform iterations
    for j = 1:n
        w(j+1) = w(j) + h * f(t(j), w(j));
    end

end