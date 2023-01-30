import 'package:example/components/WaterfallFlowList/index.dart';
import 'package:example/pages/home/components/Kingkong/index.dart';
import 'package:example/pages/home/components/ListItem/index.dart';
import 'package:example/pages/home/components/Seckill/index.dart';
import 'package:example/pages/home/style.dart' as style;
import 'package:example/pages/home/components/HomeSwiper/index.dart';
import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

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
        onClick: () {
          Navigator.pushNamed(context, '/search');
        },
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
            Icons.person,
            color: Colors.white,
          )
        ],
      );
    }

    Widget renderSwiper() {
      final data = [
        'https://imgcps.jd.com/ling4/10026305205267/5rW35Lqn56S855uS5paw5L2O5Lu3/54iG5qy-5Y-j56KR/p-60541365d250103053e030ee/d8aa0395/cr_1125x449_0_166/s/q70.jpg',
        'https://m15.360buyimg.com/mobilecms/jfs/t1/190067/25/29976/87832/63719790Ee36edb45/9be2dfafb817f6a6.jpg!cr_1125x449_0_166!q70.jpg',
        'https://m15.360buyimg.com/mobilecms/jfs/t1/195829/6/31276/54389/63cb33faF066e6a86/6bf2a5c00686aac2.jpg!cr_1125x449_0_166!q70.jpg',
        'https://m15.360buyimg.com/mobilecms/s1062x420_jfs/t1/19535/26/20349/38863/63aa4f80Fa0f42c16/e8006c8573dcf124.jpg!cr_1053x420_4_0!q70.jpg',
        'https://m15.360buyimg.com/mobilecms/jfs/t1/166472/38/33929/92773/63bfdb13F398d8d76/64255f4806c77ce5.jpg!cr_1053x420_4_0!q70.jpg',
        'https://imgcps.jd.com/ling4/10060226888399/54ix6L2m5pCt6YWN/6L2m5YaF5pGp55m756m66Ze0/p-61b4e0db000915522e1192c4/7b6b4ed0/cr_1053x420_4_0/s/q70.jpg'
      ];
      return HomeSwiper(
        data: data,
      );
    }

    Widget renderIconGroup() {
      final List<Map> data = [
        {
          "name": "京东超市",
          "img":
              "https://m15.360buyimg.com/mobilecms/jfs/t1/187640/12/30456/5256/639c2315Ebc95c142/350a8f0c766f5460.png"
        },
        {
          "name": "数码电器",
          "img":
              "https://m15.360buyimg.com/mobilecms/jfs/t1/178015/31/13828/6862/60ec0c04Ee2fd63ac/ccf74d805a059a44.png"
        },
        {
          "name": "京东新百货",
          "img":
              "https://m15.360buyimg.com/mobilecms/jfs/t1/54043/33/19389/4660/62b049dbE3b9aef75/2fcd31afd5d702e4.png"
        },
        {
          "name": "京东生鲜",
          'img':
              "http://m15.360buyimg.com/mobilecms/jfs/t1/177902/16/13776/5658/60ec0e71E801087f2/a0d5a68bf1461e6d.png"
        },
        {
          "name": "京东到家",
          "img":
              "https://m15.360buyimg.com/mobilecms/jfs/t1/196472/7/12807/7127/60ec0ea3Efe11835b/37c65625d94cae75.png"
        },
        {
          "name": "充值缴费",
          "img":
              "https://m15.360buyimg.com/mobilecms/jfs/t1/185733/21/13527/6648/60ec0f31E0fea3e0a/d86d463521140bb6.png"
        },
        {
          "name": "附近好店",
          "img":
              "https://m15.360buyimg.com/mobilecms/jfs/t1/34248/39/16616/4689/62bbbdccE9f11132e/d51caf15f2f412b2.png"
        },
        {
          "name": "领券",
          "img":
              "https://m15.360buyimg.com/mobilecms/jfs/t1/186080/16/13681/8175/60ec0fcdE032af6cf/c5acd2f8454c40e1.png"
        },
        {
          "name": "PLUS会员",
          "img":
              "https://m15.360buyimg.com/mobilecms/jfs/t1/37709/6/15279/6118/60ec1046E4b5592c6/a7d6b66354efb141.png"
        },
        {
          "name": "京东国际",
          "img":
              "https://m15.360buyimg.com/mobilecms/jfs/t1/191060/24/12861/6818/60ec11f2E67cf5ee6/c264378678b3cd96.png"
        }
      ];
      data.addAll(data.toList());
      data.addAll(data.toList());
      return KingKong(
        data: data,
      );
    }

    Widget renderSeckill() {
      final data = [
        {
          'img':
              'https://m.360buyimg.com/seckillcms/jfs/t1/90352/32/34369/222045/63c7b5e3Fc32fb13f/a9f5f11f69fde2bf.jpg',
          "price": "189"
        },
        {
          'img':
              'https://m.360buyimg.com/seckillcms/jfs/t1/90352/32/34369/222045/63c7b5e3Fc32fb13f/a9f5f11f69fde2bf.jpg',
          "price": "189"
        },
        {
          'img':
              'https://m.360buyimg.com/seckillcms/jfs/t1/90352/32/34369/222045/63c7b5e3Fc32fb13f/a9f5f11f69fde2bf.jpg',
          "price": "189"
        },
        {
          'img':
              'https://m.360buyimg.com/seckillcms/jfs/t1/90352/32/34369/222045/63c7b5e3Fc32fb13f/a9f5f11f69fde2bf.jpg',
          "price": "189"
        },
        {
          'img':
              'https://m.360buyimg.com/seckillcms/jfs/t1/90352/32/34369/222045/63c7b5e3Fc32fb13f/a9f5f11f69fde2bf.jpg',
          "price": "189"
        },
        {
          'img':
              'https://m.360buyimg.com/seckillcms/jfs/t1/90352/32/34369/222045/63c7b5e3Fc32fb13f/a9f5f11f69fde2bf.jpg',
          "price": "189"
        },
      ];
      data.addAll(data.toList());
      return Seckill(data: data);
    }

    Widget renderList() {
      final data = List.generate(
          100,
          (e) => ({
                'img':
                    'https://img10.360buyimg.com/mobilecms/s360x360_jfs/t1/87913/30/29005/142264/63d0f640Fc0797c9e/db8594f3456ba10c.jpg!q70.dpg.webp',
                'name':
                    '海尔 (Haier)冰箱646升双开门对开门 一级能效双变频 净味保鲜大容量家用电冰箱 低温触媒+智能WIFI+立体送风+精储格局',
                'price': '4798',
                'tag': '1000'
              }));
      return WaterfallFlowList(
          data: data, renderItem: (Map item, int index) => ListItem());
    }

    Widget renderView() {
      return View(
        styles: style.getMain(),
        event: {
          'scroll': (double a) {
            print('滚动${a}');
            return;
          }
        },
        children: [
          SafeArea(
              child: View(
            children: [
              renderHeader(),
              renderSwiper(),
              renderIconGroup(),
              renderSeckill(),
              renderList()
            ],
          ))
        ],
      );
    }

    return renderView();
  }
}
