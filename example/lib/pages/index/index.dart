import 'package:example/pages/home/index.dart';
import 'package:example/pages/search/index.dart';
import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

class Index extends HookWidget {
  const Index({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pages = useState<List<Widget>>([Home(), Search()]);
    final pagesIndex = useState(0);
    final tabs = useState([]);
    // final request = useRequest();
    // final tabs = request[IndexRequest.tabbar] as ValueNotifier<List>;
    Widget renderTabbarItem(int index, Map item) {
      return Frame(
        styles: [FL_Flex(size: 1), FL_ItemCenter, FL_JustifyCenter],
        onClick: () {
          pagesIndex.value = index;
        },
        children: [
          ImageView(
            styles: [FL_Height(size: 46), FL_Width(size: 60)],
            url: pagesIndex.value == index
                ? item['navIcon']['active']
                : item['navIcon']['def'],
          ),
        ],
      );
    }

    renderTabbar() {
      print('tabs.value${tabs.value}');
      return Frame(
        styles: [
          FL_FlexRow,
          FL_ItemCenter,
          FL_Height(size: 50),
          FL_JustifyCenter,
          FL_BackgroundColor(color: Colors.white),
          // FL_Absolute,
          // FL_AbsBottom(size: 0),
          // FL_AbsLeft(size: 0),
          // FL_AbsRight(size: 0)
        ],
        children: tabs.value
            .asMap()
            .keys
            .map((index) => renderTabbarItem(index, tabs.value[index]))
            .toList(),
      );
    }

    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: renderTabbar(),
        ),
        body: PageView(
          // controller: controller,
          allowImplicitScrolling: true,
          physics: NeverScrollableScrollPhysics(),
          children: pages.value,
          onPageChanged: (index) {
            pagesIndex.value = index;
          },
        ));
  }
}
