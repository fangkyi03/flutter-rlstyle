import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

class MainView extends HookWidget {
  final Widget? child;
  MainView({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: SafeArea(
          child: child!,
          // top: false,
          bottom: false,
        ));
  }
}
