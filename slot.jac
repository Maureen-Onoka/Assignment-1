"""slot machine game"""

import from random { randint }

walker SlotGame {
    has symbols: list[str] = ["melon", "apple", "orange", "star"];
    has row: list[str] = [];

    def process_bet(bet: int) -> int {
        self.row = [];  # clear previous results

        print("Starting the game!");

        # Spin three random symbols
        for i in range(3) {
            self.row.append(self.symbols[randint(0, len(self.symbols) - 1)]);
        }

        print(f"Result: {self.row}");

        # Check winnings
        if self.row[0] == self.row[1] == self.row[2] {
            print(f"Jackpot! Three {self.row[0]}s! You won 10x your bet!");
            return int(bet * 10);
        } elif self.row[0] == self.row[1] or self.row[1] == self.row[2] or self.row[0] == self.row[2] {
            print("Two similar symbols! You won twice your bet!");
            return int(bet * 2);
        } else {
            print("Better luck next time!");
            return int(0);
        }
    }
}

with entry {
    print(" Starting Slot Machine Game...");

    while True {
        let bet_amount = input("Place your bet amount or type 'q' to exit: ");
        if bet_amount.lower() == "q" {
            print("Thanks for playing! Bye!");
            break;
        }

        if not bet_amount.isdigit() {
            print("Invalid input! Please enter a number.");
            continue;
        }

        let bet = int(bet_amount);
        if bet <= 0 {
            print("Bet amount must be greater than 0!");
            continue;
        }

        let game = root spawn SlotGame();
        let winnings = int(game.process_bet(bet));  # ensure winnings is integer

        if winnings > 0 {
            print(f" You won {winnings} coins!");
        } else {
            print(" Better luck next time!");
        }

        print("-----------------------------------");
    }
}
