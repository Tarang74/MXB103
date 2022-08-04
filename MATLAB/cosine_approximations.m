% a)
figure
hold on
fplot(@(x) cos(x), [0, pi / 2])

% b)
fplot(@(x) 1 - x^2 / 4, [0, pi / 2])

% c)
fplot(@(x) 1 - x^2 / 4 + x^4 / 24, [0, pi / 2])

title("Plot of cosine function using Taylor polynomials")
xlabel("x")
ylabel("y")