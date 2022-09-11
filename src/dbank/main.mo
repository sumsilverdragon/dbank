// import module to debug(print)
import Debug "mo:base/Debug";

// class that holds canister
actor DBank {
  //holds current value of money in this bank
  var currentValue = 300;
  currentValue := 100;

  let id = 82394723828341084;

  // Debug.print(debug_show(currentValue));
  // Debug.print(debug_show(id));

  // public function for user to deposit money
  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  // public function fro users to withdraw amount from currentValue
  public func withdraw(amount: Nat) {
    // deccrease currentValue by the amount
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
  }
}