from dataclasses import dataclass
from sympy import N, Float, Integer, Rational
import math


@dataclass
class FloatingPointSystem:
    beta: Integer = 10
    k: Integer = 3
    m: Integer = -2
    M: Integer = 2

    minimum: Float = Float(0)
    maximum: Float = Float(0)

    unitRoundoff: Float = Float(0)

    def __init__(
            self, beta: Integer, k: Integer, m: Integer, M: Integer):
        self.beta = beta
        self.k = k
        self.m = m
        self.M = M

        self.minimum = self.beta ** self.m
        self.maximum = (1 - self.beta ** (-self.k)) * self.beta ** (self.M + 1)

        self.unitRoundoff = Rational(1, 2) * self.beta ** (1 - self.k)
    
    def info(self):
        return f"F(beta={self.beta}, k={self.k}, m={self.m}, M={self.M})"

    def info(self):
        return f"F(beta = {self.beta}, k = {self.k}, m = {self.m}, M = {self.M})\nMin = {N(self.minimum, self.k)}\nMax = {N(self.maximum, self.k)}\nu   = {N(self.unitRoundoff, self.k)}"

F = FloatingPointSystem(10, 2, -1, 1)
print(F.info())