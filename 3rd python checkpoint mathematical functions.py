
def add(n1, n2):
    return n1 + n2

def subtract(n1, n2):
    return n1 - n2

def multiply(n1, n2):
    return n1 * n2

def divide(n1, n2):
    if n2 == 0:
        return "Error: Division by zero is undefined."
    return n1 / n2


operations = {
    "+": add,
    "-": subtract,
    "*": multiply,
    "/": divide
}


def calculator():
    print("Welcome to the calculator program!")
    num1 = float(input("Enter the first number: "))
    print("Available operations:")
    for symbol in operations:
        print(symbol)
    should_continue = True
    while should_continue:
        operation_symbol = input("Pick an operation: ")
        
        
        if operation_symbol not in operations:
            print("Invalid operation. Please try again.")
            continue
        
        
        num2 = float(input("Enter the next number: "))
        
        calculation_function = operations[operation_symbol]
        
        
        answer = calculation_function(num1, num2)
        
      
        print(f"{num1} {operation_symbol} {num2} = {answer}")
        
       
        cont = input(f"Type 'yes' to continue with {answer}, or 'no' to start a new calculation: ").lower()
        if cont == "yes":
            num1 = answer  
        else:
            should_continue = False
            calculator()  


calculator()
