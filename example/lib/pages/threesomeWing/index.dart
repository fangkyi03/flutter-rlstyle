import 'package:flutter/material.dart';
import 'package:rlstyles/Component/CssRule.dart';
import 'package:rlstyles/main.dart';

class ThreeSomeWing extends HookWidget {
  const ThreeSomeWing({Key? key}) : super(key: key);

  getStyle() {
    return {
      'main': {
        CssRule.backgroundColor: 'yellow',
        CssRule.flexDirection: 'column',
        CssRule.height: double.infinity,
        CssRule.width: double.infinity
      },
      'header': {
        CssRule.height: 50,
        CssRule.backgroundColor: 'red',
        CssRule.flexDirection: 'row',
        CssRule.position: 'rel',
        CssRule.width: double.infinity,
        CssRule.justifyContent: 'center',
        CssRule.alignItems: 'center'
      },
      'headerLeft': {
        CssRule.flexDirection: 'row',
        CssRule.backgroundColor: 'black',
        CssRule.position: 'abs',
        CssRule.left: 0,
        CssRule.top: 0,
        CssRule.bottom: 0,
        CssRule.justifyContent: 'center',
        CssRule.alignItems: 'center',
        CssRule.color: 'white',
        CssRule.paddingRight: 50,
        CssRule.paddingLeft: 20,
      },
      'headerRight': {
        CssRule.flexDirection: 'row',
        CssRule.width: 50,
        CssRule.backgroundColor: 'black',
        CssRule.position: 'abs',
        CssRule.right: 0,
        CssRule.top: 0,
        CssRule.bottom: 10,
        CssRule.justifyContent: 'center',
        CssRule.alignItems: 'center',
        CssRule.color: 'blue',
      },
      'title': {
        CssRule.color: 'black',
        CssRule.width: '100%',
        CssRule.height: '100%',
        CssRule.justifyContent: 'center',
        CssRule.alignItems: 'center',
        CssRule.fontSize: 20,
      }
    };
  }

  renderHeaderRight() {
    return View(
      styles: getStyle()['headerRight'],
      children: [TextView('right')],
    );
  }

  renderHeaderLeft() {
    return View(
      styles: getStyle()['headerLeft'],
      children: [TextView('123123')],
    );
  }

  renderHeader() {
    return View(
      styles: getStyle()['header'],
      children: [
        View(
          styles: getStyle()['title'],
          children: [TextView('标题')],
        ),
        renderHeaderLeft(),
        renderHeaderRight()
      ],
      // children: [renderHeaderLeft()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return View(
      styles: getStyle()['main'],
      children: [
        renderHeader(),
        Container(
          height: 50,
          color: Colors.red,
          child: Row(
            children: [Text('1231')],
          ),
        )
      ],
      // children: [renderHeader()],
    );
    return Container(
      // width: null,
      // height: null,
      color: Colors.black,
      // decoration: BoxDecoration(color: Colors.blue),
      child: Column(children: [
        Container(
          height: 50,
          color: Colors.red,
          child: Row(
            children: [Text('1231')],
          ),
        )
      ]),
    );
  }
}
