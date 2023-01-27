import 'package:flutter/material.dart';
import 'package:rlstyles/Component/Styles.dart';
import 'package:rlstyles/Component/StylesMap.dart';
import 'package:rlstyles/Tailwind/index.dart';

// ignore: must_be_immutable
class ScrollViewContainer extends StatelessWidget {
  ScrollViewContainer({
    Key? key,
    this.children = const [],
    this.styles = const {},
  }) : super(key: key) {
    final type = this.styles.runtimeType.toString();
    if (type == 'List<Map<String, dynamic>>' ||
        type == 'List<Map<String, String>>') {
      mStyles = StylesMap.formMap(mergeStyle(this.styles));
    } else {
      mStyles = StylesMap.formMap(this.styles ?? {});
    }
  }
  Styles mStyles = const Styles();
  final dynamic styles;
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
        controller: controller,
        scrollDirection: getScrollDirection(),
        shrinkWrap: true,
        slivers: [
          new SliverList(delegate: new SliverChildListDelegate(this.children))
        ]);
  }

  @override
  Widget build(BuildContext context) {
    if (mStyles.scrollBar) {
      return Scrollbar(
        child: renderScroll(),
        controller: controller,
      );
    }
    return renderScroll();
  }
}
