
class Account:
    
    def __init__(self, account_number, account_holder, account_balance=0.0):
        self.account_number = account_number  
        self.account_holder = account_holder  
        self.account_balance = account_balance  
    
    
    def deposit(self, amount):
        if amount > 0:  
            self.account_balance += amount  
            print(f"${amount} deposited successfully. New balance: ${self.account_balance:.2f}")
        else:
            print("Deposit amount must be greater than 0.")
    
    
    def withdraw(self, amount):
        if amount > self.account_balance:  
            print("Insufficient funds. Withdrawal not processed.")
        elif amount <= 0:  
            print("Withdrawal amount must be greater than 0.")
        else:
            self.account_balance -= amount  
            print(f"${amount} withdrawn successfully. New balance: ${self.account_balance:.2f}")
    
    
    def check_balance(self):
        print(f"Current balance: ${self.account_balance:.2f}")
        return self.account_balance  


my_account = Account("007", "Amira B")


my_account.deposit(500000000000)          
my_account.withdraw(2000000)         
my_account.check_balance()       


savings_account = Account("008", "Vampire", 5)
savings_account.deposit(25)     
savings_account.withdraw(10)   
savings_account.check_balance()  
