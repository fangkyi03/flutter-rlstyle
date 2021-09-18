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
        CssRule.height: double.infinity
      },
      'header': {
        CssRule.height: 50,
        CssRule.width: 360,
        CssRule.alignItems: 'center',
        CssRule.backgroundColor: 'blue'
      },
      'headerLeft': {
        CssRule.flexDirection: 'row',
        CssRule.width: '50%',
        CssRule.backgroundColor: 'black'
      }
    };
  }

  renderHeaderLeft() {
    return View(
      styles: getStyle()['headerLeft'],
      children: [],
    );
  }

  renderHeader() {
    return View(
      styles: getStyle()['header'],
      children: [renderHeaderLeft(), renderHeaderLeft(), renderHeaderLeft()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return View(
      styles: getStyle()['main'],
      children: [renderHeader()],
    );
    // return Column(children: [
    //   Container(
    //     height: 50,
    //     color: Colors.red,
    //     child: Row(
    //       children: [
    //         Expanded(
    //             child: FractionallySizedBox(
    //           widthFactor: 0.5,
    //           child: Container(
    //             color: Colors.black,
    //           ),
    //         )),
    //         Text('1231')
    //       ],
    //     ),
    //   )
    // ]);
  }
}
