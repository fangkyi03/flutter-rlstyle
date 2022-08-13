import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

void main() {
  runApp(Home());
}

class Home extends HookWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget renderBody() {
      return View(
        children: [
          View(
            onClick: () {
              print('点击');
            },
            styles: mergeStyle([FL_Color(color: Colors.blue)]),
            children: [TextView('中国')],
          )
        ],
        styles: mergeStyle([
          FL_FlexColumn,
          FL_AlignCenter,
          FL_JustifyCenter,
          FL_Width(size: 100),
          FL_BgColor(color: Colors.red),
          FL_Height(size: 200),
        ]),
      );
    }

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: Scaffold(body: renderBody()),
        );
      },
    );
  }
}
