import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:rlstyles/Component/CssRule.dart';
import 'package:rlstyles/main.dart';
// final Widget bottomTab = createBottomRoutrer(router:{
//   'home':BottomRouterConfig(
//     screen:(navigation,navi)=>Main()
//   ),
//   config:(){
//     bottomBar:
//   }
// });

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  Main({Key key, this.navigation}) : super(key: key);

  final NavigationOption navigation;

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  Map<String, dynamic> getStyle() {
    return {
      'main': {
        CssRule.flexWrap: 'wrap',
        CssRule.flexDirection: 'row',
        CssRule.backgroundColor: 'black',
        CssRule.width: double.infinity,
        CssRule.height: 800
      },
      'listItem': {
        CssRule.width: '50%',
        CssRule.height: '50%',
        CssRule.backgroundColor: 'blue',
        CssRule.justifyContent: 'center',
        CssRule.alignItems: 'center',
        CssRule.flexDirection: "column"
      }
    };
  }

  Widget renderListItem() {
    return View(styles: getStyle()['listItem'], children: [
      TextView('测试'),
      View(
        styles: {
          CssRule.width: '30%',
          CssRule.backgroundColor: 'red'
          // CssRule.height: '50%',
        },
        children: [TextView('1')],
      )
    ]);
  }

  List<Widget> renderList() {
    return List.generate(10, (index) => null)
        .map((e) => renderListItem())
        .toList();
  }

  Widget renderView() {
    return View(styles: getStyle()['main'], children: this.renderList());
  }

  Widget renderTest() {
    return View(styles: {
      CssRule.width: '100%',
      CssRule.height: 600
    }, children: [
      View(
        styles: {
          CssRule.flex: 1,
          CssRule.backgroundColor: 'black',
          CssRule.alignItems: 'center',
          CssRule.justifyContent: 'center',
          CssRule.color: 'red',
          CssRule.height: double.infinity * 0.1
        },
        children: [TextView('123123')],
      ),
      View(styles: {CssRule.flex: 2, CssRule.backgroundColor: 'red'})
    ]);
  }

  Widget renderDemo() {
    return Container(
        width: 300,
        height: 500,
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(0),
        child: Row(
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.green,
            ),
            Expanded(
              child: FractionallySizedBox(
                widthFactor: 0.9,
                heightFactor: 0.5,
                child: Container(color: Colors.blue),
              ),
            ),
            Expanded(
              child: FractionallySizedBox(
                widthFactor: 0.9,
                heightFactor: 0.5,
                child: Container(color: Colors.red),
              ),
            )
          ],
        ));
  }

  renderMain() {
    return MaterialApp(home: Scaffold(body: renderTest()));
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => this.renderMain(),
    );
  }
}
