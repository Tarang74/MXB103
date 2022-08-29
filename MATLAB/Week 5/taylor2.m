function [t, w, h] = taylor2(f, fdash, a, b, alpha, n)

    % calculate h
    h = (b - a) / n;

    % create t array
    t = a:h:b;
    
    % initialise w array
    w = zeros(size(t));
    w(1) = alpha;

    for j = 1:n
        w(j+1) = w(j) + h * f(t(j), w(j)) + h^2 / 2 * fdash(t(j), w(j));
    end

end