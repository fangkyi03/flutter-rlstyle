import 'package:rlstyles/Component/CssRule.dart';
import 'package:rlstyles/main.dart';
import 'package:flutter/material.dart';

class V3 extends HookWidget {
  const V3({Key? key}) : super(key: key);

  getStyle() {
    return {
      'main': {
        CssRule.height: 280,
        CssRule.backgroundColor: 'yellow',
      },
      'left': {
        CssRule.height: 80,
        CssRule.borderColor: 'black',
        CssRule.borderWidth: 1,
        CssRule.alignItems: 'center',
        CssRule.justifyContent: 'center',
        CssRule.flex: 1
      },
      'right': {
        CssRule.borderColor: 'black',
        CssRule.borderWidth: 1,
        CssRule.flex: 1,
        CssRule.height: '100%',
        CssRule.flexDirection: 'column',
        CssRule.justifyContent: 'center',
        CssRule.alignItems: 'center',
      },
      'right1': {
        CssRule.flex: 1,
      }
    };
  }

  renderLeft() {
    return View(
      styles: getStyle()['left'],
      children: [TextView('child')],
    );
  }

  renderRight() {
    return View(
      styles: getStyle()['right'],
      children: [TextView('12')],
    );
  }

  @override
  Widget build(BuildContext context) {
    return View(
      styles: getStyle()['main'],
      children: [
        renderLeft(),
        renderRight(),
      ],
    );
  }
}
