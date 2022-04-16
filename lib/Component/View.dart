// ignore_for_file: unrelated_type_equality_checks
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rlstyles/Tool/Tool.dart';
import 'package:rlstyles/Tool/base.dart' as base;
import 'package:rlstyles/main.dart';

// ignore: must_be_immutable
class View extends StatelessWidget {
  final List<Widget> children;
  final String? type;
  final GestureTapCallback? onClick;
  final Map? styles;
  final bool block;
  Styles mStyles = const Styles();
  View(
      {Key? key,
      this.children = const [],
      this.styles = const {},
      this.type,
      this.onClick,
      this.block = true})
      : super(key: key) {
    mStyles = StylesMap.formMap(styles ?? {});
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

  setStyle(Map newStyles) {
    // if (newStyles.isNotEmpty) {
    //   Map obj = {...newStyles, ...styles ?? {}};
    //   mStyles = StylesMap.formMap(obj);
    // }
  }

  Widget renderAbsolute(child) {
    if (getTypeOf(child)) {
      return Positioned(
          left: getSize(size: child.mStyles.left, defValue: null),
          right: getSize(size: child.mStyles.right, defValue: null),
          top: getSize(size: child.mStyles.top, defValue: null),
          bottom: getSize(size: child.mStyles.bottom, defValue: null),
          child: renderContainer(child, child.mStyles));
    } else {
      return child;
    }
  }

  Map getChildren(List<Widget> children) {
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
    return Expanded(
        child: FractionallySizedBox(
      widthFactor: mWidth ?? null,
      heightFactor: mHeight ?? null,
      child: child,
    ));
  }

  renderContainer(Widget child, [Styles? styles]) {
    Styles newStyles = styles ?? mStyles;
    Widget view = Container(
        margin: getMargin(newStyles),
        padding: getPadding(newStyles),
        width: newStyles.width != null ? getWidth(newStyles) : null,
        height: newStyles.height != null ? getHeight(newStyles) : null,
        decoration: getDecoration(newStyles),
        constraints: getContaionMaxMin(newStyles),
        child: child);
    if (getPercentageState()) {
      return this.renderOpacity(renderPercentage(child: view));
    } else {
      return renderOpacity(view);
    }
  }

  renderChildrenView() {
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
        ...(getPositionZindex(childData['mAbsolute'])
            .map((e) => renderAbsolute(e))
            .toList()),
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
      return ScrollViewContainer(children: [child], styles: styles);
    } else {
      return child;
    }
  }

  renderGrid(List<Widget> children) {
    return GridView.count(
        shrinkWrap: true,
        crossAxisCount: mStyles.gridCount!,
        children: children);
  }

  renderView() {
    if (mStyles.display == 'grid') {
      return renderContainer(renderGrid(children));
    } else {
      return renderFlex(renderContainer(renderChildrenView()));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (mStyles.display == 'none') {
      return renderEmpty();
    } else if (children.isNotEmpty && children.length > 0) {
      return renderGestureDetector(renderView());
    } else {
      return renderGestureDetector(renderView());
    }
  }
}
