import 'package:example/pages/home/index.dart';
import 'package:example/pages/search/index.dart';
import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

class Index extends HookWidget {
  const Index({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pages = useState<List<Widget>>([Home(), Search()]);
    final PageController controller = PageController(initialPage: 0);
    renderTabbarItem(int index, Map item) {
      return View(
        styles: [FL_Flex(size: 1), FL_ItemCenter, FL_JustifyCenter],
        onClick: () {
          controller.jumpToPage(index);
        },
        children: [Icon(Icons.abc), TextView(item['name'])],
      );
    }

    renderTabbar() {
      final list = [
        {"name": "首页"},
        {"name": '我的'}
      ];
      return View(
        styles: [
          FL_FlexRow,
          FL_ItemCenter,
          FL_Height(size: 40),
          FL_JustifyCenter,
          FL_BackgroundColor(color: Colors.white),
          // FL_Absolute,
          // FL_AbsBottom(size: 0),
          // FL_AbsLeft(size: 0),
          // FL_AbsRight(size: 0)
        ],
        children: list
            .asMap()
            .keys
            .map((index) => renderTabbarItem(index, list[index]))
            .toList(),
      );
    }

    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: renderTabbar(),
        ),
        body: PageView(
          controller: controller,
          allowImplicitScrolling: true,
          physics: NeverScrollableScrollPhysics(),
          children: pages.value,
        ));
  }
}
