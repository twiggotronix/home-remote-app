
import 'dart:math';

class Device {
  String id;
  String name;
  bool isOn;
  Device({required this.id, required this.name, required this.isOn });

  String shortName() {
    String newName = name.substring(0, min(20, name.length));
    if(name.length > 20) {
      newName += "...";
    }
    return newName;
  }
}