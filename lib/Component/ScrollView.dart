import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

typedef ScrollCallback = Null Function(double number);

// ignore: must_be_immutable
class ScrollViewContainer extends HookWidget {
  Styles mStyles = const Styles();
  final ScrollCallback? onScroll;
  final dynamic styles;
  final List<Widget> children;
  final ScrollController controller = ScrollController();
  ScrollViewContainer(
      {Key? key,
      this.children = const [],
      this.styles = const {},
      this.onScroll})
      : super(key: key) {
    mStyles = StylesMap.formMap(mergeStyle(this.styles));
  }
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      controller.addListener(() {
        if (onScroll != null) {
          onScroll!(controller.offset);
        }
      });
      return;
    }, [controller]);
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
          physics: ClampingScrollPhysics(),
          slivers: [
            new SliverList(delegate: new SliverChildListDelegate(this.children))
          ]);
    }

    if (mStyles.scrollBar) {
      return Scrollbar(
        child: renderScroll(),
        controller: controller,
      );
    }
    return renderScroll();
  }
}
