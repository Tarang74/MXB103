function [t, w, h] = modeuler(f, a, b, alpha, n)

    % calculate h
    h = (b - a) / n;

    % create t array
    t = a:h:b;
    
    % initialise w array
    w = zeros(size(t));
    w(1) = alpha;

    for j = 1:n
        k1 = h * f(t(j), w(j));
        k2 = h * f(t(j) + h, w(j) + k1);
        w(j+1) = w(j) + 1 / 2 * (k1 + k2);
    end

end