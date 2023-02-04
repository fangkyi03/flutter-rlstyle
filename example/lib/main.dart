import 'package:example/components/Main/index.dart';
import 'package:example/pages/home/index.dart';
import 'package:example/pages/index/index.dart';
import 'package:example/pages/search/index.dart';
import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

void main() {
  runApp(Main());
}

class Main extends HookWidget {
  const Main({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    getRouter() {
      return {
        '/home': (BuildContext context) => Index(),
        '/search': (BuildContext context) => Search()
      };
    }

    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (
        BuildContext context,
      ) {
        return MaterialApp(
          routes: getRouter(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: Home(),
          initialRoute: '/home',
          builder: (context, child) {
            ScreenUtil.setContext(context);
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!);
          },
        );
      },
    );
  }
}
