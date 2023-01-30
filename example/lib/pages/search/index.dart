import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';
import './style.dart' as style;

class Search extends HookWidget {
  const Search({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return View(
      styles: style.main(),
      children: [TextView('child')],
    );
  }
}
