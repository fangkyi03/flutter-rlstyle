import 'package:flutter/material.dart';

class ScrollViewContainer extends StatelessWidget {

  ScrollViewContainer({
    Key key, 
    this.children,
    this.scrollDirection
  }) : super(key: key);

  final List<Widget> children;
  final Axis scrollDirection;
  final ScrollController controller = ScrollController();

  getScrollDirection () {
    if (scrollDirection != null ) {
      return scrollDirection;
    }else {
      return Axis.vertical;
    }
  }

  void animate (double offset) {
    controller.animateTo(offset,duration:Duration(milliseconds: 1000),curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: CustomScrollView(
      controller:controller ,
      scrollDirection:getScrollDirection(),
      shrinkWrap: true,
      // 内容
      slivers: <Widget>[
        new SliverList(
            delegate: new SliverChildListDelegate(children)
        )
      ]
    )
    );
  }
}
