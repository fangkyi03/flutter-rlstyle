import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

NavigationOption navigation;

class NavigationOption {
  NavigationOption(
    this.routerConfig
  );
  final Map<String,RouterConfig> routerConfig;

  void onBackDown (BuildContext context) {
    goBack(context);
  }

  getAppBar (RouterConfig router,context) {
    if (router.option != null) {
      return router.option.appBar;
    }else {
      return  AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: ()=>onBackDown(context),
        ),
      );
    }
  }

  getBackgroundColor (RouterConfig router,context) {
    ThemeData themeData = Theme.of(context);
    if (router.option != null && router.option.backgroundColor != null ) {
      return router.option.backgroundColor;
    }else {
      return themeData.primaryColor;
    }
  }

  void navigate(BuildContext context,String routerName,{Map<String,dynamic> navigationParams = const {}}) {
    RouterConfig select = routerConfig[routerName];
    if (select != null) {
      Navigator.of(context).push(new MaterialPageRoute(builder:(BuildContext context){
        return Scaffold(
          backgroundColor: getBackgroundColor(select,context),
          appBar:getAppBar(select,context),
          body: SafeArea(
            child: select.screen(navigation,navigationParams),
          ),
        );
      }));
    }
  }
  void goBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class StackRouterOption {
  StackRouterOption(
    {
      this.routerName,
      this.appBar,
      this.backgroundColor
    }
  );
  final String routerName;
  final AppBar appBar;
  final Color backgroundColor;
}

class RouterConfig {
  RouterConfig({
    this.screen,
    this.option
  });
  final screelBack screen;
  final StackRouterOption option;
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
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(child:routerData[keys[0]].screen(navigation,{}))
    ));
  }
}

// 创建容器页面
Widget createStackRouter({Map<String,RouterConfig> router,Map<String,String> option}) {
  if (router.isNotEmpty) {
    return Router(routerData:router,optionData: option);
  }else {
    return Container(width: 0,height: 0);
  }
}
