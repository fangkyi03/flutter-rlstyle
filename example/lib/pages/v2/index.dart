import 'package:example/component/Button/index.dart';
import 'package:example/component/Button/item.dart';
import 'package:example/component/ButtonGroup/index.dart';
import 'package:rlstyles/main.dart';
import 'package:flutter/material.dart';

class V2 extends HookWidget {
  const V2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonGroup(
        data: List.generate(
            200,
            (index) => (ButtonItem(
                name: 'Item $index',
                style: {
                  CssRule.borderRadius: 20,
                },
                onClick: () {
                  print('点击$index');
                }))));
  }
}
