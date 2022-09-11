function T = divided_differences(X, Y)
    %divided_differences Newton's divided difference table
    % T = divided_differences(X, Y) returns Newton's divided
    % difference table for the points (X(i), Y(i)).
    % Note that the divided difference table T is stored as:
    % f[x0]
    % f[x1] f[x0,x1]
    % f[x2] f[x1,x2] f[x0,x1,x2]
    % f[x3] f[x2,x3] f[x1,x2,x3] f[x0,x1,x2,x3]
    % etc.
    %The rest of the array is zero.
    %In particular, the X column is NOT included in the table.
   
    n = length(X);
    if n ~= length(Y)
        error('X and Y must have the same length.');
    end

    %Construct empty divided difference table
    T = zeros(n, n);

    %Fill first column
    T(:, 1) = Y;

    %Fill remaining columns (REPLACE ? WITH CORRECT EXPRESSIONS)
    for j = 2:n % j is the column index
        for i = j:n % i is the row index
            T(i, j) = (T(i, j - 1) - T(i - 1, j - 1)) / (X(i) - X(i - j + 1));
        end
    end

end