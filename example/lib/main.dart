import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
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
  renderMain() {
    return MaterialApp(
        home: Scaffold(
            body: View(
        styles: {
          CssRule.flexWrap: 'wrap',
          CssRule.flexDirection: 'row',
          CssRule.backgroundColor: 'red',
          CssRule.flexWrapRunSpacing: 1,
          CssRule.flexWrapSpacing: 1,
          CssRule.width: 210,
          CssRule.height: 800
        },
        children: List.generate(10, (index) => null)
        .map((e) => View(styles: {
              CssRule.width: 100,
              CssRule.height: 100,
              CssRule.backgroundColor: 'blue',
              CssRule.justifyContent: 'center',
              CssRule.alignItems: 'center'
            }, children: [
              TextView('测试')
            ]))
        .toList())
        )
      );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      allowFontScaling: false,
      builder: () => this.renderMain(),
    );
  }
}
