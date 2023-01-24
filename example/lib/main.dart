import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

void main() {
  runApp(Home());
}

class Home extends HookWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final styles = {
      'header': [
        FL_Width(size: double.infinity),
        FL_Height(size: 50),
        FL_BgColor(color: Colors.white),
        FL_AlignCenter,
        FL_JustifyCenter
      ],
      'body': [FL_BgColor(color: Colors.grey), FL_WFull, FL_HFull],
      'headerLeft': [
        FL_Absolute,
        FL_AbsLeft(size: 10),
        FL_AbsTop(size: 0),
        FL_AbsBottom(size: 0),
        FL_AlignCenter,
        FL_JustifyCenter,
      ],
      'headerRight': [
        FL_Absolute,
        FL_AbsRight(size: 10),
        FL_AbsTop(size: 0),
        FL_AbsBottom(size: 0),
        FL_AlignCenter,
        FL_JustifyCenter,
      ]
    };
    Widget renderHeaderLeft() {
      return View(
        styles: styles['headerLeft'],
        children: [
          Icon(
            Icons.mail,
            size: 20,
          )
        ],
      );
    }

    Widget renderHeaderRight() {
      return View(
        styles: styles['headerRight'],
        children: [TextView('ceshi')],
      );
    }

    Widget renderHeader() {
      return View(
        styles: styles['header'],
        children: [
          renderHeaderLeft(),
          TextView('12312313231'),
          renderHeaderRight()
        ],
      );
    }

    Widget renderBanner() {
      return View(
        children: [TextView('banner1212')],
      );
    }

    Widget renderView() {
      return View(
        styles: [
          FL_AlignCenter,
          FL_JustifyCenter,
          FL_WFull,
          FL_HFull,
        ],
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
              child: View(
                styles: [
                  FL_Width(size: 200),
                  FL_Height(size: 50),
                  FL_Color(color: Colors.red),
                  FL_FSize(size: 20),
                  FL_BorderLeftBottom(color: Colors.red, size: 10),
                  FL_BorderBottom(color: Colors.red, size: 10),
                  FL_AlignCenter,
                  FL_JustifyCenter,
                ],
                children: [TextView('取消')],
              ))
        ],
      );
    }

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (
        BuildContext context,
      ) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: Scaffold(
              body: SafeArea(
            child: renderView(),
          )),
        );
      },
    );
  }
}
