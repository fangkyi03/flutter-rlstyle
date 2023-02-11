import 'package:example/components/CountDown/index.dart';
import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';
import './style.dart' as style;

class Seckill extends HookWidget {
  final data;
  const Seckill({Key? key, this.data = const []}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isEnd = useState(false);
    Widget renderImage(Map item) {
      return View(
        styles: style.image(),
        children: [
          ImageView(
            url: item['img'],
            styles: style.scrollImage(),
          ),
          View(
            styles: style.text(),
            children: [
              TextView(
                '￥',
                styles: [FL_Font_Size(size: 12)],
              ),
              TextView(
                item['price'],
                styles: [FL_Font_Size(size: 14)],
              )
            ],
          )
        ],
      );
    }

    Widget renderMore() {
      return View(
        styles: [
          FL_Width(size: 20),
          FL_BgColor(color: '#f5f5f5'),
          FL_Font_Color(color: 'rgb(102,102,102)'),
          FL_Font_Size(size: 12),
        ],
        children: [TextView('查看全部')],
      );
    }

    Widget renderImageGroup() {
      return View(
        styles: style.imageGroup(),
        children: [...data.map((e) => renderImage(e)).toList(), renderMore()],
      );
    }

    Widget renderKillMore() {
      return View(
        styles: [
          FL_FlexRow,
          FL_AlignCenter,
          FL_Font_Color(color: '#f23030'),
          FL_Font_Size(size: 12)
        ],
        children: [
          TextView(
            '爆款轮番秒',
            styles: [FL_MarginRight(size: 5)],
          ),
          ImageView(
            styles: [FL_Width(size: 11), FL_Height(size: 11), FL_BgSizeCover],
            url:
                'https://wq.360buyimg.com/jdm-home-page/pages/images/arrow_rt_2ccb8cd5.png',
          )
        ],
      );
    }

    Widget renderSecOrder() {
      return View(
        styles: [FL_FlexRow, FL_AlignCenter, FL_MarginRight(size: 10)],
        children: [
          TextView(
            '0',
            styles: [FL_Font_Color(color: '#ff2727')],
          ),
          ImageView(
            styles: [FL_Width(size: 20), FL_Height(size: 17), FL_BgSizeCover],
            url:
                'https://wq.360buyimg.com/jdm-home-page/pages/images/seckill-time-to_1de70c91.png',
          )
        ],
      );
    }

    Widget renderHeaderLeft() {
      return View(
        styles: [FL_FlexRow, FL_AlignCenter],
        children: [
          TextView(
            '京东秒杀',
            styles: style.killText(),
          ),
          renderSecOrder(),
          CountDown(
            onEnd: () {
              isEnd.value = true;
              return;
            },
          )
        ],
      );
    }

    Widget renderHeaderView() {
      return View(
        styles: style.headerView(),
        children: [renderHeaderLeft(), renderKillMore()],
      );
    }

    Widget renderHeader() {
      return View(
        styles: style.header(),
        children: [
          ImageView(
            url: 'lib/pages/home/asset/header-bk.png',
            styles: style.headerBkImage(),
          ),
          renderHeaderView()
        ],
      );
    }

    if (isEnd.value) return Container();
    return View(
      styles: style.main(),
      children: [renderHeader(), renderImageGroup()],
    );
  }
}
