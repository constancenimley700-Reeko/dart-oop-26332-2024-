class BusCard {
  String _owner = '';
  int _balance = 0;

  // Constructor
  BusCard(String owner, int balance) {
    _owner = owner;
    _balance = balance;
  }

  // Getter for owner
  String get owner {
    return _owner;
  }

  // TODO 1: Getter for balance
  int get balance {
    return _balance;
  }

  // Setter for owner, with a rule
  set owner(String newName) {
    if (newName.length < 3) {
      print('Error: name too short');
    } else {
      _owner = newName;
    }
  }

  // Method to display card details
  void showInfo() {
    print('Owner: $_owner | Balance: $_balance RWF');
  }

  // TODO 2: Method topUp (int amount)
  void topUp(int amount) {
    if (amount >= 500 && amount <= 50000) {
      _balance = _balance + amount;
      print('Topped up $amount RWF');
    } else {
      print('Error: top-up must be 500 to 50000 RWF');
    }
  }

  // TODO 3: Method pay (int fare)
  void pay(int fare) {
    if (fare > _balance) {
      print('Card declined');
    } else {
      _balance = _balance - fare;
      print('Paid $fare RWF');
    }
  }
}

class StudentCard extends BusCard {
  int _discount = 0;

  // Constructor
  StudentCard(String owner, int balance, int discount) : super(owner, balance) {
    _discount = discount;
  }

  // Override showInfo
  @override
  void showInfo() {
    super.showInfo();
    print('Student card: $_discount% off');
  }

  // TODO 4: Override pay (int fare)
  @override
  void pay(int fare) {
    int off = fare * _discount ~/ 100;
    print('Student discount: $off RWF');
    super.pay(fare - off);
  }
}

void main() {
  // My numbers from Student ID 26332: D = 32, L = 2
  // Starting balance = 1000 + (32 * 10) = 1320 RWF
  // Bus fare = 200 + 32 = 232 RWF
  // Discount = 10 + 2 = 12%

  int startingBalance = 1320;
  int busFare = 232;
  int discount = 12;
  String myFullName = 'Constance B Nimley';

  // Create a card with your name and starting balance, then test the setter
  BusCard card = BusCard(myFullName, startingBalance);
  card.owner = 'Al'; // refused: name too short
  card.showInfo();

  // TODO 5: Change the owner to your full name, then call showInfo()
  card.owner = myFullName;
  card.showInfo();

  // TODO 6: Top up 100 RWF (must be refused), then top up 2000 RWF
  card.topUp(100);
  card.topUp(2000);

  // TODO 7: Pay your bus fare 2 times, then call showInfo()
  card.pay(busFare);
  card.pay(busFare);
  card.showInfo();

  // TODO 8: Create a StudentCard with your name, starting balance and discount
  StudentCard studentCard = StudentCard(myFullName, startingBalance, discount);

  // TODO 9: Pay your bus fare with the student card, then call showInfo()
  studentCard.pay(busFare);
  studentCard.showInfo();
}