function u = unit_roundoff(beta, k)
%unit_roundoff Unit roundoff of floating point system
% u = unit_roundoff(beta, k) returns the unit roundoff of the floating
% point system with base beta and k digits in the significand.
    u = 1 / 2 * beta^(1 - k);
end