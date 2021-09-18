// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rlstyles/Component/StylesMap.dart';
import 'package:rlstyles/Tool/Tool.dart';
import 'package:rlstyles/Tool/base.dart' as base;
import 'package:rlstyles/main.dart';
import './Styles.dart';

// ignore: must_be_immutable
class View extends StatelessWidget {
  final List<Widget>? children;
  final String? type;
  final Styles? className;
  final GestureTapCallback? onClick;
  final Map? styles;
  Styles mStyles = const Styles();
  View(
      {Key? key,
      this.children,
      this.styles,
      this.type,
      this.className,
      this.onClick})
      : super(key: key) {
    mStyles = StylesMap.formMap(styles ?? {});
  }

  renderEmpty() {
    return Container();
  }

  bool getTypeOf(runtimeType) {
    List<String> filterArr = ['TextView', 'ImageView', 'View'];
    return filterArr.indexOf(runtimeType.toString()) != -1;
  }

  getAbsType(Type runtimeType, dynamic select) {
    if (getTypeOf(runtimeType) &&
        select.mStyles.position != null &&
        (select.mStyles.position == 'abs' ||
            select.mStyles.position == 'absolute')) {
      return true;
    } else if (runtimeType.toString().toLowerCase().indexOf('position') != -1) {
      return true;
    } else {
      return false;
    }
  }

  Widget renderRow(List<Widget> childrenList) {
    if (childrenList != null) {
      return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: getJustifyContent(mStyles),
          crossAxisAlignment: getAlignItems(mStyles),
          textDirection: getRowDirection(mStyles),
          children: childrenList.map((e) => getRLChild(e)).toList());
    } else {
      return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: getJustifyContent(mStyles),
          crossAxisAlignment: getAlignItems(mStyles),
          textDirection: getRowDirection(mStyles),
          children: childrenList.map((e) => getRLChild(e)).toList());
    }
  }

  Widget getRLChild(Widget child) {
    if (getTypeOf(child.runtimeType)) {
      // (child as dynamic).setStyle(styles);
      return child;
    } else {
      return child;
    }
  }

  Widget renderColumn(List<Widget> childrenList) {
    if (childrenList != null) {
      return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: getJustifyContent(mStyles),
          crossAxisAlignment: getAlignItems(mStyles),
          textDirection: TextDirection.ltr,
          verticalDirection: getDirection(mStyles),
          children: childrenList.map((e) => getRLChild(e)).toList());
    } else {
      return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: getJustifyContent(mStyles),
          crossAxisAlignment: getAlignItems(mStyles),
          textDirection: TextDirection.ltr,
          verticalDirection: getDirection(mStyles),
          children: childrenList.map((e) => getRLChild(e)).toList());
    }
  }

  Widget renderFlex(Widget child) {
    if (mStyles.flex != null) {
      return Expanded(child: child, flex: mStyles.flex as int);
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
      element = mStyles.flexDirection == 'row'
          ? renderRow(mTree)
          : renderColumn(mTree);
    }
    return renderContainer(element);
  }

  setStyle(Map newStyle) {}

  Widget renderAbsolute(child) {
    if (getTypeOf(child.runtimeType)) {
      return Positioned(
          left: getSize(size: child.mStyles.left, defValue: null),
          right: getSize(size: child.mStyles.right, defValue: null),
          top: getSize(size: child.mStyles.top, defValue: null),
          bottom: getSize(size: child.mStyles.bottom, defValue: null),
          child: child);
    } else {
      return child;
    }
  }

  Map getChildren(List<Widget> children) {
    List<Widget> mAbsolute = [];
    List<Widget> mTree = [];
    if (children.length == 0) return renderEmpty();
    children.forEach((element) {
      dynamic select = (element as dynamic);
      Type runtimeType = element.runtimeType;
      if (getAbsType(runtimeType, select)) {
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
    return renderOpacity(renderContainer(child));
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

  renderContainer(Widget child) {
    final view = Container(
        margin: getMargin(mStyles),
        padding: getPadding(mStyles),
        width: mStyles.width != null ? getWidth(mStyles) : null,
        height: mStyles.height != null ? getHeight(mStyles) : null,
        decoration: getDecoration(mStyles),
        constraints: getContaionMaxMin(mStyles),
        child: child);
    if (getPercentageState()) {
      return this.renderOpacity(renderPercentage(child: view));
    } else {
      return renderOpacity(view);
    }
  }

  renderChildrenView() {
    Map childData = getChildren(children!);
    if (childData['mAbsolute'].length == 0) {
      if (childData['mTree'].length > 0) {
        return renderChildreTree(childData['mTree']);
      } else {
        return renderEmpty();
      }
    } else {
      return renderStack([
        renderChildreTree(childData['mTree']),
        ...(this
            .getPositionZindex(childData['mAbsolute'])
            .map((e) => renderAbsolute(e))
            .toList()),
      ]);
    }
  }

  renderGestureDetector(Widget child) {
    if (onClick != null) {
      return GestureDetector(
        onTap: onClick,
        child: child,
      );
    } else {
      return child;
    }
  }

  renderPosition(Widget child) {
    return child;
  }

  @override
  Widget build(BuildContext context) {
    if (mStyles.display == 'none') {
      return renderEmpty();
    } else if (children != null && children!.length > 0) {
      return renderFlex(renderGestureDetector(renderChildrenView()));
    } else {
      return renderFlex(renderGestureDetector(renderContainer(Container())));
    }
  }
}
