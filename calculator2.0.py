import math

class Calculator:
    def __init__(self):
        self.operations = {
            "+": lambda x, y: x + y,
            "-": lambda x, y: x - y,
            "*": lambda x, y: x * y,
            "/": lambda x, y: x / y if y != 0 else "Error: Division by zero"
        }

    def add_operation(self, symbol, function):
        self.operations[symbol] = function

    def calculate(self, num1, op, num2):
        if op in self.operations and isinstance(num1, (int, float)) and isinstance(num2, (int, float)):
            return self.operations[op](num1, num2)
        else:
            raise ValueError("Invalid operation or input values.")

def exponentiation(x, y):
    return x ** y

def square_root(x):
    return math.sqrt(x)

def logarithm(x):
    return math.log(x)

calc = Calculator()
calc.add_operation("^", exponentiation)
calc.add_operation("sqrt", lambda x: square_root(x))
calc.add_operation("log", lambda x: logarithm(x))
