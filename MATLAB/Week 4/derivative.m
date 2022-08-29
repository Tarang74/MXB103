function g = derivative( f, n )
%DERIVATIVE Symbolic derivative of function
%   g = derivative(f) returns the derivative of f.
%   g = derivative(f, n) returns the nth derivative of f.

% If n is not specified, default is first derivative
if nargin == 1
    n = 1;
end

% Perhaps one day MATLAB will support the obvious syntax g = diff(f, n).
% But until that day comes, we have this horrible mess.
g = matlabFunction(diff(sym(f), n));

end