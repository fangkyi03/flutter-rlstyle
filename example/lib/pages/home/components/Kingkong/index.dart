import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';
import './style.dart' as style;

class KingKong extends HookWidget {
  final List data;
  const KingKong({Key? key, this.data = const []}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget renderIcon(Map item) {
      return View(
        styles: style.icon(item['color']),
        children: [
          ImageView(
            styles: style.img(),
            url: item["img"] ?? '',
          ),
          TextView(item['name'])
        ],
      );
    }

    return View(
      styles: style.main(),
      children: [
        Swiper(
          loop: false,
          curve: Curves.bounceIn,
          itemCount: (data.length ~/ 10).toInt(),
          pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colors.white,
              size: 5,
              activeSize: 6,
              activeColor: Colors.red,
            ),
          ),
          itemBuilder: (context, index) {
            return View(
                styles: style.group(),
                children: data
                    .getRange(index * 10, (index + 1) * 10)
                    .map((e) => renderIcon(e))
                    .toList());
          },
        )
      ],
    );
  }
}
