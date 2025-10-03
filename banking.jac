def account_balance(account_balance:float)-> float{
    return account_balance;
}
def new_balance(new_balance:float)-> float {
    return initial_balance + deposit;
}
def withdraw_amount(withdraw_amount:float)-> float {
    return withdraw_amount;
    }
    
with entry {
    let deposit = float(input("Enter the deposit Amount: "));
    let withdrawal_amt = float(input("Enter the withdrawal Amount: "));
    let initial_balance = float(input("Enter the initial balance: "));
    let balance = initial_balance + deposit;

    if withdrawal_amt > balance {
        print("Insufficient funds! Current balance = {balance}");
    } else {
        balance = balance - withdrawal_amt;
        print("Withdrawal successful! New balance = {balance}");
    }

    print("Account balance =", {balance});
    
}
