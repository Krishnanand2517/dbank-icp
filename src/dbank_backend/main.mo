import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  // Variable
  stable var currentValue : Float = 300;
  // currentValue := 100;

  // Constant
  // let constValue = 23;
  // constValue := 17; gives error!

  // Debug.print("Radhe Radhe!");
  // Debug.print(debug_show (currentValue));

  stable var startTime = Time.now();
  Debug.print(debug_show (startTime));

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdraw(amount : Float) {
    if (amount <= currentValue) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Not enough funds!");
    };
  };

  public query func checkBalance() : async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNanoSeconds = currentTime - startTime;
    let timeElapsedSeconds = timeElapsedNanoSeconds / 1000000000;

    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedSeconds / 10));

    startTime := currentTime;
  };
};
