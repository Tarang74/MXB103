function y = prev(x)
%PREV Next smallest floating point number
%   y = prev(x) returns the next smallest floating point number than x
%
% Tim Moroney, 2013.

y = x - eps(x);

% Fix up the cases where epsilon jumps by a factor of 2
fix = next(y) ~= x;
y(fix) = x(fix) - eps(x(fix)) / 2;

% Fix up special values
y(x == inf) = realmax;
y(x == -inf) = nan;
y(isnan(x)) = nan;

% Sanity check
z = next(y);
assert(isequal(x(~isnan(y)), z(~isnan(y))));

% if x == inf
%     y = realmax;
% elseif x == -inf || isnan(x)
%     y = nan;
% else
%     y = x - eps(x);
%     if next(y) ~= x
%         y = x - eps(x)/2;
%     end
%     assert(next(y) == x);
% end

end
