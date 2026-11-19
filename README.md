Name: Constance B Nimley | Student ID: 26332 | Course Reference: Kigali Bus Card (Nov 19, 2026)
Dart Asignment: Question Ask while solving codes
Reg# 26332
D = 32 
L = 2



// Part 1: Why Is There No Setter for Balance?
 Omitting a public setter for _balance is a core application of encapsulation and data protection in
object-oriented programming:
Prevents unauthorized manipulation: If a public set balance(int value) existed, any external
code could directly assign an arbitrary balance (such as card.balance = 1000000; ) without paying
real money, or accidentally set a negative balance.
Enforces business rules: By keeping _balance private and providing only controlled methods—
topUp() and pay() —every balance change is forced through validation checks (ensuring top-ups
are strictly between 500 and 50,000 RWF and preventing fares from exceeding the available balance).
Maintains audit integrity: Real transit cards (such as Kigali Tap&Go cards) only allow balance
changes through authorized top-up terminals or validated fare deductions, never through direct
memory edits.

// Part 2: What Does ~/ Do in Dart?
In Dart, ~/ is the truncating (integer) division operator. Unlike standard division ( / ), which always
returns a floating-point double , the ~/ operator divides two numbers and discards any fractional
remainder to return an int .
print(237 * 17 / 100); calculates 4029 / 100 and outputs 40.29 (a double ).
print(237 * 17 ~/ 100); calculates 4029 ~/ 100 , truncates the decimal .29 , and outputs 40
(an int ).

// Why it is needed here: Because _balance and fare are stored as whole-number integers ( int ) in
Rwandan Francs (RWF), Dart will not allow assigning a double result directly into an int variable ( int
off ). Using ~/ ensures the discount amount is an exact integer ready for subtraction.

// Part 3: Expected Console Output of main.dart

-Error: name too short
-Owner: Constance B Nimley | Balance: 1320 RWF
-Owner: Constance B Nimley | Balance: 1320 RWF
-Error: top-up must be 500 to 50000 RWF
-Topped up 2000 RWF
-Paid 232 RWF
-Paid 232 RWF
-Owner: Constance B Nimley | Balance: 2856 RWF
-Student discount: 27 RWF
-Paid 205 RWF
-Owner: Constance B Nimley | Balance: 1115 RWF
-Student card: 12% off

// Part 4: Expected Console Output of bug_hunt.dart
100:
Why it outputs 100: In main(), Phone p = new Phone('Tecno', 50); creates a Phone instance starting with _battery = 50 (and new is valid in Dart even though it is optional).   p.battery = 100; calls your new battery setter, which checks that 100 is within 0 to 100 and updates _battery to 100.   print(p.battery); calls the battery getter (without parentheses ()), returning 100 and printing 100 to the console.


//Part 5: Output Prediction & Explanation
    The program will print:
1
5

Step-by-Step Reasoning ("Why")
First block ( Bag a ):
1. Bag a = Bag(); creates a bag with _items = 0 .
2. a.add(); calls Bag.add() , increasing _items by 1 ( 0 + 1 = 1 ).
3. a.items = -5; invokes the setter set items(int value) . Because -5 >= 0 is false , the
if condition blocks the update and _items stays 1 .
4. print(a.items); reads the getter and prints 1 .
Second block ( BigBag b ):
1. BigBag b = BigBag(); creates a big bag with _items = 0 .
2. First b.add(); executes the overridden method, which calls super.add() twice (adding 1 + 1 =
2 ).
3. Second b.add(); calls super.add() twice again (adding 1 + 1 = 4 ).
4. b.items = b.items + 1; evaluates the right side first ( 4 + 1 = 5 ), then passes 5 to the
inherited setter. Since 5 >= 0 is true , _items becomes 5 .
5. print(b.items); prints 5 .