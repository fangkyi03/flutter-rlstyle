import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';
import './style.dart' as style;
import 'package:card_swiper/card_swiper.dart';

class HomeSwiper extends HookWidget {
  final data;
  const HomeSwiper({Key? key, this.data = const []}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Frame(
      styles: style.swiper(),
      children: [
        Frame(
          styles: style.swiperContainer(),
          children: [
            Swiper(
                loop: true,
                // autoplay: true,
                duration: 2000,
                itemBuilder: (BuildContext context, int index) {
                  return ImageView(
                      styles: style.swiperImage(), url: data[index]);
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
