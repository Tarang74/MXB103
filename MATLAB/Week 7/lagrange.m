function y = lagrange(X, Y, x)
%lagrange Evaluate interpolating polynomial using Lagrange form.
% y = lagrange(X, Y, x) returns y = P(x), where P is the interpolating
% polynomial through the points defined by X and Y
    n = length(X);
    if n ~= length(Y)
        error('X and Y must have the same length.');
    end

    y = zeros(size(x)); % initialise sum
    for i = 1:n % loop over sum index
        L = ones(size(x)); % initialise product
        for j = [1:i-1 i+1:n] % loop over product index
            L = L .* (x - X(j)) / (X(i) - X(j)); %complete missing line % multiply next factor
        end
        y = y + L * Y(i); %complete missing line % add next term
    end

