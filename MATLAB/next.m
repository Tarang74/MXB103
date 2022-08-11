function y = next(x)
%NEXT Next largest double precision floating point number
%   INPUT
%   x: double precision floating point array
%
%   OUTPUT
%   y: next largest double precision floating point values than x
%
% Tim Moroney, 2013.

y = x + eps(x);
y(x == -inf) = -realmax;

% if x == -inf
%     y = -realmax;
% else
%     y = x + eps(x);
% end

end

