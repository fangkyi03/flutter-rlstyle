import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

typedef OnClick = void Function();

class Button extends HookWidget {
  final String type;
  final bool ghost;
  final String name;
  final OnClick? onClick;
  final Map<String, dynamic> style;
  const Button(this.name,
      {Key? key,
      this.type = 'primary',
      this.ghost = false,
      this.onClick,
      this.style = const {}})
      : super(key: key);

  getStyle() {
    return {
      'button': {
        CssRule.width: 120,
        CssRule.height: 42,
        CssRule.alignItems: 'center',
        CssRule.justifyContent: 'center',
        CssRule.marginRight: 20,
        CssRule.marginTop: 10
      },
      'primary-ghost': {
        CssRule.backgroundColor: 'white',
        CssRule.color: '#00B454',
        CssRule.borderColor: '#00B454',
        CssRule.borderWidth: 1,
        CssRule.borderStyle: 'solid'
      },
      'primary': {
        CssRule.backgroundColor: '#00B454',
        CssRule.borderRadius: 4,
        CssRule.color: 'white'
      }
    };
  }

  Map getButtonStyle() {
    String styleName = type + (ghost == true ? '-ghost' : '');
    return {...getStyle()['button'], ...getStyle()[styleName], ...style};
  }

  @override
  Widget build(BuildContext context) {
    return View(
      styles: getButtonStyle(),
      onClick: onClick,
      children: [TextView(name)],
    );
  }
}
