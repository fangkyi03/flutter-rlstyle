import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';
import './style.dart' as style;
import 'package:card_swiper/card_swiper.dart';

class OpenApp extends HookWidget {
  final bool opacity;
  final VoidCallback? onEnd;
  const OpenApp({Key? key, this.opacity = true, this.onEnd}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final list = ['打开京东APP', '购物更轻松'];
    final showModal = useState(true);
    final showModalOpacity = useState(true);
    renderSwiper() {
      return Frame(styles: style.swiperView(), children: [
        Swiper(
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
        )
      ]);
    }

    renderView() {
      return Frame(
        styles: style.main(),
        children: [
          Frame(
            styles: [
              FL_Width(size: 186),
              FL_Height(size: 40),
            ],
            children: [
              ImageView(
                width: 186,
                height: 40,
                url:
                    'https://img12.360buyimg.com/img/s372x80_jfs/t1/169576/11/7635/6641/6035b6f3Eef97a89c/a6772680a123d8e3.png',
              ),
              Frame(
                styles: style.swiper(),
                children: [renderSwiper()],
              )
            ],
          )
        ],
      );
    }

    if (!showModal.value) return Container();
    return Frame(
      styles: [FL_JustifyCenter, FL_ItemCenter],
      onClick: () {
        showModalOpacity.value = false;
      },
      children: [
        AnimatedOpacity(
          onEnd: () {
            showModal.value = false;
          },
          opacity: showModalOpacity.value ? 1.0 : 0.0,
          duration: Duration(milliseconds: 250),
          child: renderView(),
        )
      ],
    );
  }
}
