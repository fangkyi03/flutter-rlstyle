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
  Map<String, dynamic> getStyle() {
    return {
      'main': {
        CssRule.flexWrap: 'wrap',
        CssRule.flexDirection: 'row',
        CssRule.backgroundColor: 'red',
        CssRule.flexWrapRunSpacing: 1,
        CssRule.flexWrapSpacing: 1,
        CssRule.width: 210,
        CssRule.height: 800
      },
      'listItem': {
        CssRule.width: 100,
        CssRule.height: 100,
        CssRule.backgroundColor: 'blue',
        CssRule.justifyContent: 'center',
        CssRule.alignItems: 'center'
      }
    };
  }

  Widget renderListItem() {
    return View(styles: getStyle()['listItem'], children: [TextView('测试')]);
  }

  List<Widget> renderList() {
    return List.generate(10, (index) => null)
        .map((e) => renderListItem())
        .toList();
  }

  renderMain() {
    return MaterialApp(
        home: Scaffold(
            body:
                View(styles: getStyle()['main'], children: this.renderList())));
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
