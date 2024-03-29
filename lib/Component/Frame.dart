// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:rlstyles/Tool/Tool.dart';
import 'package:rlstyles/Tool/base.dart' as base;
import 'package:rlstyles/main.dart';

// ignore: must_be_immutable
class Frame extends StatelessWidget {
  final List<Widget> children;
  final String? type;
  final GestureTapCallback? onClick;
  final Map<String, dynamic>? event;
  final dynamic styles;
  Styles mStyles = const Styles();
  Frame(
      {Key? key,
      this.children = const [],
      this.styles,
      this.type,
      this.onClick,
      this.event = const {}})
      : super(key: key) {
    mStyles = StylesMap.formMap(mergeStyle(this.styles));
  }
  renderEmpty() {
    return Container();
  }

  bool getTypeOf(Widget element) {
    if (element is TextView || element is ImageView || element is View) {
      return true;
    } else {
      return false;
    }
  }

  getAbsType(Widget element, dynamic select) {
    if (getTypeOf(element) &&
        select.mStyles.position != null &&
        (select.mStyles.position == 'abs' ||
            select.mStyles.position == 'absolute')) {
      return true;
    } else if (element is Positioned || element is AnimatedPositioned) {
      return true;
    } else {
      return false;
    }
  }

  Widget renderRow([List<Widget> childrenList = const []]) {
    List<Widget> list = childrenList.isNotEmpty ? childrenList : [Container()];
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: getJustifyContent(mStyles),
        crossAxisAlignment: getAlignItems(mStyles),
        textDirection: getRowDirection(mStyles),
        children: list.map((e) => getRLChild(e)).toList());
  }

  Widget getRLChild(Widget child) {
    if (getTypeOf(child)) {
      if (styles != null) {
        (child as dynamic).setStyle!(styles);
      }
    }
    return child;
  }

  Widget renderColumn([List<Widget> childrenList = const []]) {
    List<Widget> list = childrenList.isNotEmpty ? childrenList : [Container()];
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: getJustifyContent(mStyles),
        crossAxisAlignment: getAlignItems(mStyles),
        textDirection: TextDirection.ltr,
        verticalDirection: getDirection(mStyles),
        children: list.map((e) => getRLChild(e)).toList());
  }

  Widget renderFlex(Widget child) {
    if (mStyles.flex != null && mStyles.flex != 0) {
      // 这边比较特殊 如果直接处理onClick 这会导致flex1 是基于GestureDetector
      // 从而导致后面的flex 1没有效果 所以这边要做一个判断 让其能正常显示
      if (onClick != null) {
        return Expanded(
            child: GestureDetector(
              onTap: onClick,
              child: child,
            ),
            flex: mStyles.flex as int);
      } else {
        return Expanded(child: child, flex: mStyles.flex as int);
      }
    } else {
      return child;
    }
  }

  renderWrap(List<Widget> mChildren) {
    return Wrap(
      spacing: getSize(size: mStyles.flexWrapSpacing),
      runSpacing: getSize(size: mStyles.flexWrapRunSpacing),
      direction:
          mStyles.flexDirection == 'column' ? Axis.vertical : Axis.horizontal,
      crossAxisAlignment: getWrapJustifyContent(mStyles)!,
      alignment: getWrapAlignItems(mStyles)!,
      textDirection: getRowDirection(mStyles),
      children: mChildren,
    );
  }

  Widget renderChildreTree(List<Widget> mTree, {isContainer = false}) {
    Widget element;
    if (mStyles.flexWrap != null) {
      element = renderWrap(mTree);
    } else {
      element = mStyles.flexDirection == 'row' ||
              mStyles.flexDirection == 'row-reverse'
          ? renderRow(mTree)
          : renderColumn(mTree);
    }
    return renderScroll(element);
  }

  setStyle(dynamic newStyles) {
    // if (newStyles.isNotEmpty) {
    //   Map obj = {...newStyles, ...styles ?? {}};
    //   mStyles = StylesMap.formMap(obj);
    // }
  }

  Widget renderAbsolute(child) {
    return Positioned(
        left: getSize(size: mStyles.left, defValue: null),
        right: getSize(size: mStyles.right, defValue: null),
        top: getSize(size: mStyles.top, defValue: null),
        bottom: getSize(size: mStyles.bottom, defValue: null),
        child: renderContainer(child, mStyles));
  }

  verifyChildren(Element select) {
    print('s');
    // try {
    //   if (select.children) {
    //     return getAbsType((select.children[0] as Widget), select.children[0]);
    //   }
    // } catch (err) {
    //   return false;
    // }
  }

  verifyChild(select) {
    try {
      if (select.child) {
        return getAbsType((select.child as Widget), select.child);
      }
    } catch (err) {
      return verifyChildren(select.getChildren());
    }
  }

  deepComparison(dynamic select) {
    return verifyChild(select);
  }

  Map getChildren(List<dynamic> children) {
    List<Widget> mAbsolute = [];
    List<Widget> mTree = [];
    if (children.length == 0) return {'mAbsolute': [], 'mTree': []};
    children.forEach((element) {
      dynamic select = (element as dynamic);
      if (getAbsType(element, select)) {
        mAbsolute.add(element);
      } else {
        mTree.add(element);
      }
    });
    return {'mAbsolute': mAbsolute, 'mTree': mTree};
  }

  List<Widget> getPositionZindex(List<Widget> children) {
    children.sort((dynamic a, dynamic b) {
      try {
        if (a.mStyles.zIndex > b.mStyles.zIndex) {
          return 1;
        } else if (a.mStyles.zIndex != null && b.mStyles.zIndex == null) {
          return 1;
        } else if (b.mStyles.zIndex > a.mStyles.zIndex) {
          return 1;
        } else if (b.mStyles.zIndex != null && a.mStyles.zIndex == null) {
          return 1;
        }
        return -1;
      } catch (e) {
        return -1;
      }
    });
    return children;
  }

  renderStack(List<Widget> children) {
    return renderStackContainer(Stack(children: children));
  }

  renderOpacity(Widget child) {
    if (mStyles.opacity < 1 && mStyles.opacity > 0) {
      return Opacity(child: child, opacity: mStyles.opacity);
    } else {
      return child;
    }
  }

  renderStackContainer(Widget child) {
    return renderContainer(child);
  }

  // 判断当前是否百分比布局
  getPercentageState() {
    var mWidth = base.getTypeOf(mStyles.width);
    var mHeight = base.getTypeOf(mStyles.height);
    if (mWidth == '%' || mHeight == '%') {
      return true;
    } else {
      return false;
    }
  }

  // 百分比布局
  renderPercentage({Widget? child}) {
    double? mWidth;
    double? mHeight;
    if (base.getTypeOf(mStyles.width) == '%') {
      mWidth =
          double.parse((mStyles.width as String).replaceAll('%', '')) / 100;
    }
    if (base.getTypeOf(mStyles.height) == '%') {
      mHeight =
          double.parse((mStyles.height as String).replaceAll('%', '')) / 100;
    }
    return FractionallySizedBox(
      widthFactor: mWidth ?? null,
      heightFactor: mHeight ?? null,
      child: child,
    );
  }

  renderContainer(Widget child, [Styles? styles]) {
    Styles newStyles = styles ?? mStyles;

    Widget view = child;
    Widget mContainer;
    if (mStyles.clipRadius) {
      view = ClipRRect(
        borderRadius: getBorderRadius(newStyles),
        child: child,
      );
    }
    mContainer = Container(
        margin: getMargin(newStyles),
        padding: getPadding(newStyles),
        width: newStyles.width != null ? getWidth(newStyles) : null,
        height: newStyles.height != null ? getHeight(newStyles) : null,
        decoration: getDecoration(newStyles),
        constraints: getContaionMaxMin(newStyles),
        transform: newStyles.transform,
        child: view);
    if (getPercentageState()) {
      return this.renderOpacity(renderPercentage(child: mContainer));
    } else {
      return renderOpacity(mContainer);
    }
  }

  renderChildrenView() {
    if (mStyles.display == 'list') {
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => children[index],
        shrinkWrap: true,
        itemCount: children.length,
      );
    }
    Map childData = getChildren(children);
    if (childData['mAbsolute'].length == 0) {
      if (childData['mTree'].length > 0) {
        return renderChildreTree(childData['mTree']);
      } else {
        return renderEmpty();
      }
    } else {
      return renderStack([
        renderContainer(renderChildreTree(childData['mTree'])),
        ...(childData['mAbsolute'])
      ]);
    }
  }

  renderGestureDetector(Widget child) {
    if (onClick != null && mStyles.flex == null) {
      return GestureDetector(
        onTap: onClick,
        child: child,
      );
    } else {
      return child;
    }
  }

  renderScroll(Widget child) {
    if (mStyles.overflowX != null ||
        mStyles.overflowY != null && this.children.isNotEmpty) {
      return ScrollViewContainer(
          children: [child], styles: styles, onScroll: event!['scroll']);
    } else {
      return child;
    }
  }

  renderGrid(List<dynamic> children) {
    return GridView.count(
        shrinkWrap: true,
        crossAxisCount: mStyles.gridCount!,
        children: children as List<Widget>);
  }

  renderView() {
    if (mStyles.flexNo) {
      return renderContainer(children[0]);
    }
    if (mStyles.display == 'grid') {
      return renderGestureDetector(renderContainer(renderGrid(children)));
    } else if (mStyles.position == 'abs' || mStyles.position == 'absolute') {
      return renderAbsolute(
          renderGestureDetector(renderContainer(renderChildreTree(children))));
    } else {
      return renderGestureDetector(
          renderFlex(renderContainer(renderChildrenView())));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (mStyles.display == 'none') {
      return renderEmpty();
    } else if (children.isNotEmpty && children.length > 0) {
      return renderView();
    } else {
      return renderView();
    }
  }
}
