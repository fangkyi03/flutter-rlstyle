import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rlStyles/Styles.dart';
import 'package:rlStyles/TextView.dart';

NavigationOption navigation;

class NavigationOption {
  NavigationOption(
    this.routerConfig
  );
  final Map<String,RouterConfig> routerConfig;

  void onBackDown (BuildContext context) {
    goBack(context);
  }

  void navigate(BuildContext context,String routerName,{Map<String,dynamic> navigationParams = const {}}) {
    if (routerConfig[routerName] != null) {
      Navigator.of(context).push(new MaterialPageRoute(builder:(BuildContext context){
        return Scaffold(
          // backgroundColor: Colors.red,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: ()=>onBackDown(context),
            ),
          ),
          body: SafeArea(
            child: routerConfig[routerName].screen(navigation,navigationParams),
          ),
        );
      }));
    }
  }
  void goBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class RouterOption {
  RouterOption(
    {
      this.routerName
    }
  );
  final String routerName;
}

class RouterConfig {
  RouterConfig({
    this.screen,
    this.option
  });
  final screelBack screen;
  final RouterOption option;
}
typedef screelBack = Widget Function(NavigationOption navigationOption,Map<String,dynamic> navigationParams);

class Router extends StatelessWidget {
  const Router({
    Key key,
    this.routerData,
    this.optionData
  }) : super(key: key);

  final Map<String,RouterConfig> routerData;
  final Map<String,String> optionData;
  List<String> getRouterKeys () {
    return routerData.keys.toList();
  }

  @override
  Widget build(BuildContext context) {
    List<String> keys = getRouterKeys();
    navigation  = NavigationOption(routerData);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1330);
    return  MaterialApp( home: Scaffold(
      appBar: AppBar(
        title: TextView('演示列表',styles: Styles(color: 'white',fontSize: 50)),
        centerTitle: true,
      ),
      body: SafeArea(child:routerData[keys[0]].screen(navigation,{}))
    ));
  }
}

// 创建容器页面
Widget createRouter({Map<String,RouterConfig> router,Map<String,String> option}) {
  if (router.isNotEmpty) {
    return Router(routerData:router,optionData: option);
  }else {
    return Container(width: 0,height: 0);
  }
}

// 创建底部tab
Widget createrBottomTaber({Map<String,String> routerConfig,Map<String,String> routerNavigationConfig}) {

}