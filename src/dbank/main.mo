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

  // public function for users to withdraw amount from currentValue
  public func withdraw(amount: Nat) {
    // decrease currentValue by the amount
    let tempValue: Int = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount too large, currentValue less than zero.")
    }
    
  };

  //query function with return value: async loading
  public query func checkBalance(): async Nat {
    return currentValue;
  };
}