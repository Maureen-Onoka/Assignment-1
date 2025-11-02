impl turn.check {
    bet =input("Place your bet amount:");
    if bet.isdigit() {
        print("Spinning the reels...");
        visitor.spin_row();
        visitor.start_game();
        visitor.process_bet(int(bet));
    } else {
        print("That's not a valid number! Try again.");
    }
    visit [-->];
}   

impl SlotGame.start_game {
    print("Starting the game!");
   self.row.clear();
    for i = 0 to i < 3 by i += 1 {
        self.row.append(self.symbols[randint(0, len(self.symbols) - 1)]);
    }
    print(f"Result: {self.row}");
 
}

impl SlotGame.process_bet(bet: int) {
    
    self.row = [];

    # Spin 3 random symbols before checking results
    for i in range(3) {
        self.row.append(self.symbols[randint(0, len(self.symbols) - 1)]);
    }

    print(f"Result: {self.row}");

    if self.row[0] == "star" and self.row[1] == "star" and self.row[2] == "star" {
        print("Jackpot! You are 100 times richer!");
        return bet * 100;
    } elif self.row[0] == self.row[1] == self.row[2] {
        print(f"Three {self.row[0]}s! You won 10x your bet!");
        return bet * 10;
    } elif self.row[0] == self.row[1] or self.row[1] == self.row[2] or self.row[0] == self.row[2] {
        print("Two similar symbols! You won twice your bet!");
        return bet * 2;
    } else {
        print("No match, better luck next time!");
        return 0;
    }
}

