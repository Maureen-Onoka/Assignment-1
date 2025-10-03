def add(a:int, b:int) -> int {
    return a + b;
}

def subtract(a:int, b:int) -> int {
    return a - b;
}

with entry {
    let x = int(input("Enter first number: "));
    let y = int(input("Enter second number: "));

    print("Sum =", add(x, y));
    print("Difference =", subtract(x, y));
}
