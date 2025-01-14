# Begin by typing the line 'Welcome to Python Pizza Deliveries' which will display a welcome message when the code is run.
print("Welcome to Python Pizza Deliveries!")

# Add a line that prompts the user for the size of the pizza they want using the input() function 
# and stores the user's input in a variable named 'size'.
size = input("What size pizza do you want? S, M, or L: ").upper()

#Add a line that prompts the user if they want pepperoni on their pizza using 
# the input() function and stores the user's input in a variable named 'add_pepperoni'.
add_pepperoni = input("Do you want pepperoni? Y or N: ").upper()

#Add a line that prompts the user if they want extra cheese on their pizza using the input() 
# function and stores the user's input in a variable named 'extra_cheese'.
extra_cheese = input("Do you want extra cheese? Y or N: ").upper()

# Initialize the bill
bill = 0

# Run the code and test it by providing inputs for size, pepperoni, and extra cheese.

# Calculate the bill based on size
if size == "S":
    bill += 15
elif size == "M":
    bill += 20
elif size == "L":
    bill += 25

# Add cost for pepperoni
if add_pepperoni == "Y":
    if size == "S":
        bill += 2
    else:  # For M or L
        bill += 3

# Add cost for extra cheese
if extra_cheese == "Y":
    bill += 1

# Output the final bill
print(f"Your final bill is: ${bill}.")
