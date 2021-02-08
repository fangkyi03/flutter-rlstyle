import 'package:example/demo/demo1/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:rlstyles/Component/StylesMap.dart';
import 'package:rlstyles/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// final Widget bottomTab = createBottomRoutrer(router:{
//   'home':BottomRouterConfig(
//     screen:(navigation,navi)=>Main()
//   ),
//   config:(){
//     bottomBar:
//   }
// });

final Widget app = createStackRouter(router: {
  'main': RouterConfig(
    screen: (navigation, navigationParams) => Main(navigation: navigation),
  ),
  'demo1': RouterConfig(
      screen: (navigation, navigationParams) => Demo1(navigation: navigation)),
});

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
  onTextDown(int index) {
    widget.navigation.navigate(context, 'demo' + index.toString());
  }

  renderList() {
    List<String> data = [
      '颜色演示',
    ];
    return data.asMap().keys.map((index) {
      String item = data[index];
      return TextView(item,
          styles: Styles(color: 'black', fontSize: 50),
          onClick: () => onTextDown(index + 1));
    }).toList();
  }

  renderView() {
    return View(styles: styles['main'], children: renderList());
  }

  renderMain() {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: View(
      children: [
        TextView(
          '测试1',
          styles: Styles(fontSize: 15),
        )
      ],
      styles: Styles(
          width: 100,
          height: 44,
          backgroundColor: 'red',
          justifyContent: 'center',
          alignItems: 'center',
          borderRadius: 10),
    ))));
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
