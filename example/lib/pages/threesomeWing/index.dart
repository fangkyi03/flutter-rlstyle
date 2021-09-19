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
        CssRule.justifyContent: 'space-between',
        CssRule.alignItems: 'center',
        CssRule.borderStyle: 'solid',
        CssRule.borderColor: 'blue',
        CssRule.borderWidth: 10
      },
      'headerLeft': {
        CssRule.width: 100,
        CssRule.flexDirection: 'row',
        CssRule.backgroundColor: 'black',
        // CssRule.position: 'abs',
        // CssRule.left: 0,
        // CssRule.top: 0,
        // CssRule.bottom: 0,
        CssRule.justifyContent: 'center',
        CssRule.alignItems: 'center',
        CssRule.color: 'red',
      },
      'headerRight': {
        CssRule.flexDirection: 'row',
        CssRule.width: 50,
        CssRule.backgroundColor: 'black',
        // CssRule.position: 'abs',
        // CssRule.right: 0,
        // CssRule.top: 0,
        // CssRule.bottom: 0,
        CssRule.justifyContent: 'center',
        CssRule.alignItems: 'center',
        CssRule.color: 'blue',
      },
      'title': {
        CssRule.color: 'black',
        // CssRule.width: '100%',
        CssRule.height: '100%',
        CssRule.justifyContent: 'center',
        CssRule.alignItems: 'center',
        CssRule.fontSize: 20,
      },
      'body': {
        CssRule.flexDirection: 'row',
        CssRule.alignItems: 'center',
        CssRule.height: 280,
        CssRule.backgroundColor: 'blue',
        CssRule.flexWrap: 'wrap',
        CssRule.maxHeight: 320,
        CssRule.overflow: 'hidden'
      },
      'flex': {
        CssRule.width: 200,
        CssRule.flexDirection: 'row',
        CssRule.backgroundColor: 'red'
      },
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
        renderHeaderLeft(),
        View(
          styles: getStyle()['title'],
          children: [TextView('标题')],
        ),
        renderHeaderRight()
      ],
      // children: [renderHeaderLeft()],
    );
  }

  renderBody() {
    return View(
        styles: getStyle()['body'],
        children: List.generate(20, (index) {
          return View(
            styles: {
              CssRule.width: 100,
              CssRule.height: 100,
              CssRule.justifyContent: 'center',
              CssRule.alignItems: 'center'
            },
            children: [
              TextView(index.toString()),
            ],
          );
        }).toList());
  }

  renderBanner() {
    return ImageView(
        url:
            'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201603%2F04%2F20160304174416_PGjvQ.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634654816&t=df5fde0dab1401e77f95a6968e6c0a17',
        // url: 'https://avatars2.githubusercontent.com/u/14098?s=460&v=4',
        styles: {
          CssRule.width: 300,
          CssRule.height: 200,
          CssRule.backgroundSize: 'cover'
        });
  }

  @override
  Widget build(BuildContext context) {
    return View(
      styles: getStyle()['main'],
      children: [renderHeader(), renderBanner(), renderBanner()],
    );
  }
}
