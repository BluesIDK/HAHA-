
shopping_list = ["batata", "na3na3", "candia", "nutellagrande", "frident", "Molly"]


options = ["add", "remove", "view"]


i = "0"
while i not in options:
    i = input("tell us what u wanna do... ").lower()


if i == "add":
    for _ in range(10 - len(shopping_list)):  
        if len(shopping_list) >= 10:
            print("The shopping list is full. You can't add more items.")
            break
        a = input("Enter an item to add to the list: ")
        shopping_list.append(a)
        print(f"'{a}' has been added to the list.")
        print(f"Current shopping list: {shopping_list}")
        cont = input("Do you want to add another item? (yes or no): ").lower()
        if cont != "yes":
            break


elif i == "remove":
    if not shopping_list:  
        print("The shopping list is empty. Nothing to remove.")
    else:
        item_to_remove = input("Enter an item to remove: ")
        if item_to_remove in shopping_list:
            shopping_list.remove(item_to_remove)
            print(f"'{item_to_remove}' has been removed from the list.")
        else:
            print(f"'{item_to_remove}' is not in the shopping list.")
    print(f"Updated shopping list: {shopping_list}")

elif i == "view":
    if not shopping_list:  
        print("The shopping list is empty.")
    else:
        print("Your current shopping list:")
        for index, item in enumerate(shopping_list, start=1):
            print(f"{index}. {item}")

