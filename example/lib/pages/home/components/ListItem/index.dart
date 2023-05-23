import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

class ListItem extends HookWidget {
  const ListItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Frame(
      children: [TextView('child')],
    );
  }
}
