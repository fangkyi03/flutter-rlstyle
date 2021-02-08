import 'package:example/demo/demo1/index.dart';
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
          height: 80,
          backgroundColor: 'red',
          justifyContent: 'center',
          flexDirection: 'row',
          display: 'flex',
          position: 'rel',
          alignItems: 'center',
          borderRadius: 10,
          borderStyle: 'solid',
          borderWidth: 1.0,
          borderColor: 'blue',
          padding: 10.0),
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
