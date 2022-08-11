function [representation, sign, exponent, significand, type] = fl(value)
%FL IEEE 754 double precision floating point representation
%   INPUT
%   value: array of IEEE 754 double precision floating point values
%
%   OUTPUTS
%   representation: string representation of each value as
%                   +/-(significand)_2 x 2^exponent
%   sign:           string representation of the signs +/-
%   exponent:       numeric representation of the exponents
%   significand:    string representation of the significands in binary
%   type:           'normal', 'denormal', 'zero', 'infinity' or 'not a number'
%
%
% Tim Moroney, 2013.

%% Check that we have IEEE doubles
if ~isa(value, 'double')
    error('Only IEEE double precision is supported.');
end

%% For scalar value we can return directly
if numel(value) == 1
    [representation, sign, exponent, significand, type] = fl_scalar(value);
    return
end

%% Set up output arrays
representation = cell(size(value));
sign = cell(size(value));
exponent = zeros(size(value));
significand = cell(size(value));
type = cell(size(value));

%% Process each element
for i = 1:numel(value)
    [representation{i}, sign{i}, exponent(i), significand{i}, type{i}] = fl_scalar(value(i));
end

end

function [representation, sign, exponent, significand, type] = fl_scalar(value)
%FL_SCALAR IEEE 754 double precision floating point representation for scalar

%% Convert to binary string
binary_string = ieee_string(value);
assert(length(binary_string) == 64);

%% Extract sign
if binary_string(1) == '0'
    sign = '+';
else
    sign = '-';
end

%% Extract exponent
exponent_string = binary_string(2:12);
exponent = bin2dec(exponent_string) - 1023;

%% Extract significand
significand = binary_string(13:64);

%% Determine type and adjust exponent if necessary
% Some liberties are taken with inf, nan and zero in order to make their
% representations more indicative of the values they represent.
if isinf(value)
    type = 'infinity';
    exponent = inf;
elseif isnan(value)
    type = 'not a number';
    exponent = nan;
elseif exponent == -1023 % indicates either a denormal number or zero
    if value == 0
        type = 'zero';
        exponent = 0;
    else
        type = 'denormal';
        exponent = -1022;
    end
else
    type = 'normal';
end

%% Pretty up the significand
if strcmp(type, 'denormal') || strcmp(type, 'zero')
    significand = ['(0.' significand ')_2'];
else
    significand = ['(1.' significand ')_2'];
end

%% Assemble representation
representation = [sign significand ' x 2^(' num2str(exponent) ')'];

end

function [ string ] = ieee_string( value )
%IEEE_STRING Return the binary IEEE representation of a value

% Convert to binary via hex
string = hex2bin(num2hex(value));

% Now check for -0.  For some reason num2hex gets this wrong.
if value == 0 && 1/value == -inf % one of the few ways to detect -0
    string(1) = 1;
end

end


function [ binary_string ] = hex2bin( hex_string )
%HEX2BIN Convert hex string to binary string
%   Strange that this isn't included with MATLAB.  Anyway, it's easy
%   enough to convert each hex digit to decimal and then to binary.

n = length(hex_string);
binary_string = zeros(1, 4*n);  % pre-allocate with zeros

conversion_table = dec2bin(0:15); % matrix of decimal to binary mappings

p = 1; % current position in binary_string
for i = 1:n
    decimal_value = hex2dec(hex_string(i)); % hex2dec checks for any illegal characters
    binary_string(p:p+3) = conversion_table(decimal_value+1, :);
    p = p + 4;
end

binary_string = char(binary_string); % convert to a string proper

end
