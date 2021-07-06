import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
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
      builder: () => this.renderMain(),
    );
  }
}
