// import module to debug(print)
import Debug "mo:base/Debug";

// class that holds canister
actor DBank {
  //holds current value of money in this bank
  var currentValue = 300;
  currentValue := 100;

  let id = 82394723828341084;

  Debug.print(debug_show(currentValue));
  Debug.print(debug_show(id));
}