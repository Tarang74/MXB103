function y = divided_eval(X, T, x)
    %divided_eval Evaluate Newton's divided difference form of the
    %interpolating polynomial
    % y = divided_eval(X, T, x) returns y = P(x), where P is the
    % interpolating polynomial constructed using the abscissas X
    % and divided difference table T.

    [m,n] = size(T);
    if m ~= n
        error('T must be square.');
    end

    y = zeros(size(x)); % initialise sum
    for k = 1:n % loop over sum index
        P = ones(size(x)); % initialise product
        for i = 1:k-1 % loop over product index
            P = P .* (x - X(i)); % multiply next factor
        end
        y = y + T(k, k) * P; % add next term
    end
end