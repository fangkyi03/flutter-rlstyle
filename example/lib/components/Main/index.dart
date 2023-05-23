import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

class AppBar extends HookWidget implements PreferredSizeWidget {
  const AppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Frame(
      children: [TextView('child')],
    );
  }

  @override
  Size get preferredSize => Size(10, 10.0);
}

class MainView extends HookWidget {
  final Widget? child;
  final dynamic color;
  MainView({Key? key, this.child, this.color = 'white'}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        backgroundColor: HexColor(color),
        body: SafeArea(
          child: child!,
          // top: false,
          bottom: false,
        ));
  }
}
