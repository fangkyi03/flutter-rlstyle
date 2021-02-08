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
        CssRule.display: 'flex',
        CssRule.position: 'rel',
        CssRule.flexDirection: 'column',
        CssRule.height: 1000,
        CssRule.width: 360,
        CssRule.backgroundColor: 'blue',
        CssRule.alignItems: 'center',
        CssRule.justifyContent: 'center',
        CssRule.paddingTop: 50.0,
        CssRule.paddingBottom: 50.0,
        CssRule.fontSize: 25.0,
        CssRule.color: 'white',
        CssRule.fontWeight: 'bold'
      },
      children: [
        ImageView(
          url:
              'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fsoftbbs%2F1003%2F07%2Fc0%2F3134443_1267900790753_1024x1024soft.jpg&refer=http%3A%2F%2Fimg.pconline.com.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1615377250&t=f5e5a26b21746e1b37275f8110bc00d8',
          styles: {
            CssRule.width: 100,
            CssRule.height: 100,
            CssRule.marginBottom: 10.0,
            CssRule.backgroundSize: 'contain'
          },
        ),
        TextView('测试123123'),
        TextView('123131312312321312')
      ],
    )));
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
