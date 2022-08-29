function F = fibonacci(n)
%FIBONACCI Computes the nth Fibonacci number
    a = (1 + sqrt(5)) / 2;
    b = (1 - sqrt(5)) / 2;

    F = floor((a^n - b^n) / sqrt(5));
end

