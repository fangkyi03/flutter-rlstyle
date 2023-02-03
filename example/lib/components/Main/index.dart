import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

class MainView extends HookWidget {
  final Widget? child;
  final dynamic color;
  MainView({Key? key, this.child, this.color = 'white'}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor(color),
        body: SafeArea(
          child: child!,
          // top: false,
          bottom: false,
        ));
  }
}
