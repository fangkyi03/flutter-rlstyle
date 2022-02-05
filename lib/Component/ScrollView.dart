import 'package:flutter/material.dart';
import 'package:rlstyles/Component/Styles.dart';
import 'package:rlstyles/Component/StylesMap.dart';

class ScrollViewContainer extends StatelessWidget {
  ScrollViewContainer({
    Key? key,
    this.children = const [],
    this.styles = const {},
  }) : super(key: key) {
    mStyles = StylesMap.formMap(styles ?? {});
  }
  @immutable
  Styles mStyles = const Styles();
  final Map? styles;
  final List<Widget> children;
  final ScrollController controller = ScrollController();

  getScrollDirection() {
    if (mStyles.overflowY != null) {
      return Axis.vertical;
    } else if (mStyles.overflowX != null) {
      return Axis.horizontal;
    } else if (mStyles.overflow != null) {
      return Axis.vertical;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: CustomScrollView(
            // controller: controller,
            scrollDirection: getScrollDirection(),
            shrinkWrap: true,
            // 内容
            slivers: [
          new SliverList(delegate: new SliverChildListDelegate(this.children))
        ]));
  }
}
