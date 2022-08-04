function [a, b, c] = pythag_triple(n)
%PYTHAG_TRIPLE Returns a Pythagorean triple of
% the following form:
%   Output:
%       a = 2n + 1
%       b = 2n(n + 1)
%       c = 2n(n + 1) + 1
    a = 2 * n + 1;
    b = 2 * n * (n + 1);
    c = 2 * n * (n + 1) + 1;
end

