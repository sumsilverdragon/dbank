// import module to debug(print)
import Debug "mo:base/Debug";
// import time module
import Time "mo:base/Time";
//float module
import Float "mo:base/Float";

// class that holds canister
actor DBank {
  //holds current value of money in this bank > stable=persistent state ORTHOGONAL PERSISTENCE
  stable var currentValue: Float = 300;
  
  // stable start time value > nanonseconds since Jan1970
  stable var startTime = Time.now();
  // Debug.print(debug_show(startTime));

  let id = 82394723828341084;

  // Debug.print(debug_show(currentValue));
  // Debug.print(debug_show(id));

  // public function for user to deposit money
  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  // public function for users to withdraw amount from currentValue
  public func withdraw(amount: Float) {
    // decrease currentValue by the amount
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount too large, currentValue less than zero.")
    }
    
  };

  //query function with return value: async loading
  public query func checkBalance(): async Float {
    return currentValue;
  };

  //function to update compound interest
  public func compound() {
    // current moment in time
    let currentTime = Time.now();
    // elapsed time
    let timeElapsedNS = currentTime - startTime;
    // convert NS to seconds
    let timeElapsedS = timeElapsedNS / 1000000000;
    // replace currentValue with added compund interest
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    // reset startTime
    startTime := currentTime;
  };

}