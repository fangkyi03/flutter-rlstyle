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
  Styles mStyles = const Styles();
  final Map? styles;
  final List<Widget> children;
  final ScrollController controller = ScrollController();

  getScrollDirection() {
    if (mStyles.overflowY != null) {
      return Axis.vertical;
    } else if (mStyles.overflowX != null) {
      return Axis.horizontal;
    } else {
      return Axis.vertical;
    }
  }

  renderScroll() {
    return CustomScrollView(
        // controller: controller,
        scrollDirection: getScrollDirection(),
        shrinkWrap: true,
        slivers: [
          new SliverList(delegate: new SliverChildListDelegate(this.children))
        ]);
  }

  @override
  Widget build(BuildContext context) {
    if (mStyles.scrollBar) {
      return Scrollbar(child: renderScroll());
    }
    return renderScroll();
  }
}
