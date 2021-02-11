import 'package:flutter/material.dart';
import 'package:rlstyles/Component/StylesMap.dart';
import 'package:rlstyles/Tool/Tool.dart';
import './Styles.dart';

class ViewProps {
  List<Widget> children;
  Map styles;
  Styles mStyles;
}

// ignore: must_be_immutable
class View extends StatelessWidget {
  List<Widget> children;
  Map styles;
  final String type;
  final Styles className;
  Styles mStyles;
  final GestureTapCallback onClick;
  View({this.children, this.styles, this.type, this.className, this.onClick}) {
    mStyles = StylesMap.formMap(styles ?? {});
  }

  renderEmpty() {
    return Container();
  }

  getTypeOf(runtimeType) {
    List<String> filterArr = ['TextView', 'ImageView', 'View'];
    return filterArr.indexOf(runtimeType.toString()) != -1;
  }

  getAbsType(Type runtimeType, dynamic select) {
    if (this.getTypeOf(runtimeType) &&
        select.mStyles.position != null &&
        (select.mStyles.position == 'abs' ||
            select.mStyles.position == 'absolute')) {
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
          children: childrenList.map((e) => this.getRLChild(e)).toList());
    } else {
      return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: getJustifyContent(mStyles),
          crossAxisAlignment: getAlignItems(mStyles),
          textDirection: getRowDirection(mStyles),
          children: childrenList.map((e) => this.getRLChild(e)).toList());
    }
  }

  Widget getRLChild(Widget child) {
    if (this.getTypeOf(child.runtimeType)) {
      (child as dynamic).setStyle(styles);
      return child;
    } else {
      return child;
    }
  }

  Widget renderColumn(List<Widget> childrenList) {
    if (childrenList != null) {
      return Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: getJustifyContent(mStyles),
          crossAxisAlignment: getAlignItems(mStyles),
          textDirection: TextDirection.ltr,
          verticalDirection: getDirection(mStyles),
          children: childrenList.map((e) => this.getRLChild(e)).toList());
    } else {
      return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: getJustifyContent(mStyles),
          crossAxisAlignment: getAlignItems(mStyles),
          textDirection: TextDirection.ltr,
          verticalDirection: getDirection(mStyles),
          children: childrenList.map((e) => this.getRLChild(e)).toList());
    }
  }

  Widget renderFlex(Widget child) {
    return Flex(direction: getFlexDirection(mStyles), children: [child]);
  }

  Widget renderChildreTree(List<Widget> mTree, {isContainer = false}) {
    Widget element = mStyles.flexDirection == 'row'
        ? this.renderRow(mTree)
        : this.renderColumn(mTree);
    return renderContainer(element);
  }

  setStyle(Map newStyle) {}

  Widget renderAbsolute(child) {
    if (this.getTypeOf(child)) {
      return Positioned(
          left: child.mStyles.left,
          right: child.mStyles.right,
          top: child.mStyles.top,
          bottom: child.mStyles.bottom,
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
      if (this.getAbsType(runtimeType, select)) {
        mAbsolute.add(element);
      } else {
        mTree.add(element);
      }
    });
    return {'mAbsolute': mAbsolute, 'mTree': mTree};
  }

  renderStack(List<Widget> children) {
    return renderStackContainer(Stack(children: children));
  }

  renderStackContainer(Widget child) {
    return Opacity(
      child: Container(
          width: mStyles.width != null ? getWidth(mStyles) : null,
          height: mStyles.height != null ? getHeight(mStyles) : null,
          child: child),
      opacity: mStyles.opacity,
    );
  }

  renderContainer(Widget child) {
    return Opacity(
      child: Container(
          margin: getMargin(mStyles),
          padding: getPadding(mStyles),
          width: mStyles.width != null ? getWidth(mStyles) : null,
          height: mStyles.height != null ? getHeight(mStyles) : null,
          decoration: getDecoration(mStyles),
          constraints: getContaionMaxMin(mStyles),
          child: child),
      opacity: mStyles.opacity,
    );
  }

  renderChildrenView() {
    Map childData = getChildren(children);
    if (childData['mAbsolute'].length == 0) {
      if (childData['mTree'].length > 0) {
        return this.renderChildreTree(childData['mTree']);
      } else {
        return renderEmpty();
      }
    } else {
      return renderStack([
        this.renderChildreTree(childData['mTree']),
        ...(childData['mAbsolute'].map((e) => this.renderAbsolute(e)).toList())
      ]);
    }
  }

  renderGestureDetector(Widget child) {
    return GestureDetector(
      onTap: onClick,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (mStyles.display == 'none') {
      return this.renderEmpty();
    } else if (this.children != null && this.children.length > 0) {
      return this.renderGestureDetector(this.renderChildrenView());
    } else {
      return this.renderGestureDetector(this.renderContainer(null));
    }
  }
}
