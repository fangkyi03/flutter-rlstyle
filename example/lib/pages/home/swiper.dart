import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';
import './style.dart' as style;
import 'package:card_swiper/card_swiper.dart';

class HomeSwiper extends HookWidget {
  final data;
  const HomeSwiper({Key? key, this.data = const []}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return View(
      styles: style.getSwiper(),
      children: [
        View(
          styles: style.getSwiperContainer(),
          children: [
            Swiper(
                loop: true,
                // autoplay: true,
                duration: 2000,
                itemBuilder: (BuildContext context, int index) {
                  return ImageView(
                      styles: style.getSwiperImage(), url: data[index]);
                },
                itemCount: 5,
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    size: 5,
                    activeSize: 6,
                    activeColor: Colors.red,
                  ),
                )),
          ],
        )
      ],
    );
  }
}
