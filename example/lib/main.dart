import 'package:example/style.dart' as style;
import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';
import 'package:card_swiper/card_swiper.dart';

void main() {
  runApp(Home());
}

class Home extends HookWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget renderSearch() {
      return View(
        styles: style.getSearch(),
        children: [
          TextView(
            'JD',
            styles: {CssRule.color: Colors.red, CssRule.fontSize: 20},
          ),
          View(
            styles: {
              CssRule.backgroundColor: Colors.grey,
              CssRule.width: 1,
              CssRule.height: 15,
              CssRule.marginLeft: 5,
              CssRule.marginRight: 5
            },
          ),
          Icon(
            Icons.search,
            color: Colors.grey,
            size: 25,
          ),
          TextView(
            'dell显示器',
            styles: [FL_MarginLeft(size: 5)],
          )
        ],
      );
    }

    Widget renderHeader() {
      return View(
        styles: style.getHeader(),
        children: [
          Icon(
            Icons.menu,
            color: Colors.white,
          ),
          renderSearch(),
          Icon(
            Icons.my_library_add,
            color: Colors.white,
          )
        ],
      );
    }

    Widget renderSwiper() {
      return View(
        styles: style.getSwiper(),
        children: [
          View(
            styles: style.getSwiperContainer(),
            children: [
              Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ImageView(
                    styles: style.getSwiperImage(),
                    url:
                        "https://bkimg.cdn.bcebos.com/pic/cdbf6c81800a19d8bc3e2629cfb5958ba61ea8d3e8c5",
                  );
                },
                itemCount: 3,
              ),
            ],
          )
        ],
      );
    }

    Widget renderView() {
      return View(
        styles: style.getMain(),
        children: [renderHeader(), renderSwiper()],
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
              backgroundColor: Colors.red,
              body: SafeArea(
                child: renderView(),
              )),
        );
      },
    );
  }
}
