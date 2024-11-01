import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor DBank {
  // Variable
  stable var currentValue = 300;
  // currentValue := 100;

  // Constant
  // let constValue = 23;
  // constValue := 17; gives error!

  // Debug.print("Radhe Radhe!");
  // Debug.print(debug_show (currentValue));

  public func topUp(amount : Nat) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdraw(amount : Nat) {
    if (amount <= currentValue) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Not enough funds!");
    };
  };

  public query func checkBalance() : async Nat {
    return currentValue;
  };
};
