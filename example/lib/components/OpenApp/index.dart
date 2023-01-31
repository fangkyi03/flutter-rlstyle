import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';
import './style.dart' as style;
import 'package:card_swiper/card_swiper.dart';

class OpenApp extends HookWidget {
  const OpenApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final list = ['打开京东APP', '购物更轻松'];
    renderSwiper() {
      return Swiper(
        scrollDirection: Axis.vertical,
        loop: true,
        // autoplay: true,
        duration: 2000,
        itemBuilder: (BuildContext context, int index) {
          return TextView(
            list[index],
            styles: [FL_Font_Color(color: 'white'), FL_FWeight(size: 'bold')],
          );
        },
        itemCount: list.length,
      );
    }

    return View(
      styles: style.main(),
      children: [
        View(
          styles: [FL_Width(size: 186), FL_Height(size: 40)],
          children: [
            ImageView(
              width: 186,
              height: 40,
              url:
                  'https://img12.360buyimg.com/img/s372x80_jfs/t1/169576/11/7635/6641/6035b6f3Eef97a89c/a6772680a123d8e3.png',
            ),
            View(
              styles: style.swiper(),
              children: [renderSwiper()],
            )
          ],
        )
      ],
    );
  }
}
