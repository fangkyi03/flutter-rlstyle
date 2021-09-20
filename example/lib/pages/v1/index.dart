import 'dart:math';

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
      'iconGroup': {
        CssRule.flexWrap: 'wrap',
        // CssRule.gridCount: 5,
        // CssRule.display: 'grid',
        CssRule.height: 450,
      },
      'iconItem': {
        CssRule.width: '20%',
        CssRule.justifyContent: 'center',
        CssRule.alignItems: 'center',
        CssRule.backgroundColor: 'yellow',
        CssRule.borderColor: 'red',
        // CssRule.borderWidth: 1,
        // CssRule.borderStyle: 'solid',
        CssRule.flexDirection: 'column'
      }
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

  renderIcon() {
    return View(
        styles: getStyle()['iconGroup'],
        children: List.generate(20, (index) {
          return View(
            styles: getStyle()['iconItem'],
            children: [
              TextView(index.toString()),
              TextView((index * Random().nextInt(20)).toString()),
              ImageView(styles: {
                CssRule.height: 400,
                CssRule.backgroundSize: 'cover'
              }, url: 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201603%2F04%2F20160304174416_PGjvQ.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634735767&t=46ed27ffe1b8f67d7a7a9453c3168e6e')
            ],
          );
        }).toList());
  }

  @override
  Widget build(BuildContext context) {
    return View(
      styles: getStyle()['main'],
      children: [renderHeader(), renderIcon()],
    );
  }
}
