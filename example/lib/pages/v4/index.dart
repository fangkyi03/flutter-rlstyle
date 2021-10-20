import 'package:example/pages/v4/style.dart';
import 'package:rlstyles/main.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class V4 extends HookWidget {
  const V4({Key? key}) : super(key: key);

  renderHeaderMenu() {
    return View(styles: getV4Style()['header-left'], children: [
      IconButton(
          onPressed: () {
            print('Menu button pressed');
          },
          color: Colors.white,
          icon: Icon(Icons.menu))
    ]);
  }

  renderHeaderInput() {
    return View(
      styles: getV4Style()['header-input'],
      children: [
        View(styles: getV4Style()['header-input-view'], children: [
          TextView('JD', styles: getV4Style()['header-logo']),
          Icon(Icons.search, color: Colors.red, size: 18.w),
          Expanded(
              child: TextView(
            '测试1',
            styles: {CssRule.marginLeft: 5},
          ))
        ])
      ],
    );
  }

  renderHeaderRight() {
    return View(
      styles: getV4Style()['header-right'],
      children: [TextView('登录')],
    );
  }

  renderHeader() {
    return View(
      styles: getV4Style()['header'],
      children: [renderHeaderMenu(), renderHeaderRight(), renderHeaderInput()],
    );
  }

  renderSwiper() {
    return Container(
        width: 400,
        height: 130,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              "https://via.placeholder.com/288x188",
              fit: BoxFit.fill,
            );
          },
          itemCount: 10,
          itemWidth: 300,
          itemHeight: 50,
          scale: 0.9,
          layout: SwiperLayout.DEFAULT,
          pagination: new SwiperPagination(), //这些都是控件默认写好的,直接用
          // control: new SwiperControl(),
        ));
  }

  renderIconGroup() {
    return View(
      styles: getV4Style()['icon-group'],
      children: List.generate(10, (index) {
        return View(
          styles: getV4Style()['icon-item'],
          children: [
            ImageView(
              styles: getV4Style()['icon-img'],
              url:
                  'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201603%2F04%2F20160304174416_PGjvQ.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634825027&t=eb2c7dce5723048aa60a1f3c2f8afaeb',
            ),
            TextView('1231')
          ],
        );
      }),
    );
  }

  renderActiveHeader() {
    return View(
      styles: getV4Style()['active-header'],
      children: [
        View(
          styles: {CssRule.fontSize: 12, CssRule.alignItems: 'flex-end'},
          children: [
            TextView('京东秒杀'),
            TextView('16'),
            TextView('倒计时'),
          ],
        ),
        TextView('更多秒杀')
      ],
    );
  }

  renderActiveItem(int index) {
    return View(styles: getV4Style()['active-item'], children: [
      ImageView(
          url:
              'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201603%2F04%2F20160304174416_PGjvQ.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1634826143&t=a6d6f8429df1f2949df0f73f20b10abf',
          styles: {
            CssRule.width: 50,
            CssRule.height: 50,
            CssRule.backgroundSize: 'cover'
          }),
      TextView(
        '12',
        styles: {CssRule.color: 'red'},
      ),
      TextView('￥20', styles: {CssRule.color: Colors.grey})
    ]);
  }

  renderActiveGroup() {
    return View(
      styles: getV4Style()['active-group'],
      children: List.generate(6, (index) => renderActiveItem(index)),
    );
  }

  renderActive() {
    return View(
      styles: getV4Style()['active'],
      children: [renderActiveHeader(), renderActiveGroup()],
    );
  }

  renderList() {
    return View(styles: getV4Style()['list'], children: [
      Container(
        height: 3500.h,
        color: Colors.blue,
        width: 360.w,
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: View(
          styles: getV4Style()['main'],
          children: [
            renderHeader(),
            renderSwiper(),
            renderIconGroup(),
            renderActive(),
            renderList()
          ],
        ),
      ),
    );
  }
}
