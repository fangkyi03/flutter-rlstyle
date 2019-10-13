import 'package:example/demo/demo1/index.dart';
import 'package:example/demo/demo2/index.dart';
import 'package:example/demo/demo3/index.dart';
import 'package:example/demo/demo4/index.dart';
import 'package:example/demo/demo5/index.dart';
import 'package:example/demo/demo6/index.dart';
import 'package:example/demo/demo7/index.dart';
import 'package:example/demo/demo8/index.dart';
import 'package:flutter/material.dart';
import 'package:rlStyles/Router.dart';
import 'package:rlStyles/TextView.dart';
import 'package:rlStyles/View.dart';
import 'package:rlStyles/Styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
final Widget app = createRouter(router: {
  'main': RouterConfig(
    screen:(navigation,navigationParams)=> Main(navigation: navigation),
  ),
  'demo1':RouterConfig(
    screen: (navigation,navigationParams)=>Demo1(navigation: navigation)
  ),
  'demo2':RouterConfig(
    screen: (navigation,navigationParams)=>Demo2(navigation: navigation)
  ),
  'demo3':RouterConfig(
    screen: (navigation,navigationParams)=>Demo3(navigation: navigation)
  ),
  'demo4':RouterConfig(
    screen: (navigation,navigationParams)=>Demo4(navigation: navigation),
    option: RouterOption(
      appBar: null,
      backgroundColor: Colors.white
    )
  ),
  'demo5':RouterConfig(
    screen: (navigation,navigationParams)=>Demo5(navigation: navigation)
  ),
   'demo6':RouterConfig(
    screen: (navigation,navigationParams)=>Demo6(navigation: navigation),
    option: RouterOption(
      appBar: null,
      backgroundColor: Colors.white
    )
  ),
  'demo7':RouterConfig(
    screen: (navigation,navigationParams)=>Demo7(navigation: navigation),
    option: RouterOption(
      appBar: null,
      backgroundColor: Colors.white
    )
  ),
  'demo8':RouterConfig(
    screen: (navigation,navigationParams)=>Demo8(navigation: navigation),
    option: RouterOption(
      appBar: null,
      backgroundColor: Colors.transparent
    )
  ),
});

void main() {
  runApp(app);
}

class Main extends StatefulWidget {
  Main({Key key,this.navigation}) : super(key: key);

  final NavigationOption navigation;

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  onTextDown (int index) {
    widget.navigation.navigate(context, 'demo' + index.toString());
  }

  renderList () {
    List<String> data = ['颜色演示','flex布局演示','圆角','字体','滚动','登录特效','电影动画demo','裁剪曲线'];
    return data.asMap().keys.map((index){
      String item = data[index];
      return TextView(item,styles: Styles(color: 'black',fontSize: 50),onClick: ()=>onTextDown(index + 1));
    }).toList();
  }

  renderView () {
    return View(
      styles: styles['main'],
      children: renderList()
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1330);
    return renderView();
  }
}

const Map<String,Styles> styles = {
  'main':Styles(
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center',
    overflow: 'scroll',
    display: 'flex',
    flex: 1
  )
};