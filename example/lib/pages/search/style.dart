import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

main() {
  return [FL_WFull, FL_HFull, FL_BackgroundColor(color: 'white')];
}

abs() {
  return [
    FL_Absolute,
    FL_Height(size: 60),
    FL_BackgroundColor(color: Colors.red)
  ];
}
