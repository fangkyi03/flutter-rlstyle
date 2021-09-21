import 'package:flutter/material.dart';
import 'package:rlstyles/Component/CssRule.dart';
import 'package:rlstyles/main.dart';

class V1 extends HookWidget {
  const V1({Key? key}) : super(key: key);

  getStyle() {
    return {
      'main': {CssRule.backgroundColor: 'red', CssRule.flexDirection: 'column'},
      'header': {
        CssRule.height: 50,
        CssRule.backgroundColor: 'blue',
        CssRule.alignItems: 'center',
        CssRule.justifyContent: 'center',
        CssRule.flexDirection: 'row',
        CssRule.width: double.infinity
      },
      'input': {
        CssRule.width: '90%',
        CssRule.height: 30,
        CssRule.backgroundColor: '#f5f5f5',
        CssRule.color: 'white',
        CssRule.borderRadius: 25,
        CssRule.paddingLeft: 10,
        CssRule.paddingRight: 10,
        CssRule.flexDirection: 'column'
      },
    };
  }

  renderInput() {
    return View(
      styles: getStyle()['input'],
      children: [
        Expanded(
            child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 0, bottom: 0),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              )),
        ))
      ],
    );
  }

  renderHeader() {
    return View(
      styles: getStyle()['header'],
      children: [renderInput()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return View(
      styles: getStyle()['main'],
      children: [renderHeader()],
    );
  }
}
