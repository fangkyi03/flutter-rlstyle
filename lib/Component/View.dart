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
  View({this.children, this.styles, this.type, this.className}) {
    mStyles = StylesMap.formMap(styles);
  }

  renderEmpty() {
    return Container();
  }

  getTypeOf(runtimeType) {
    List<String> filterArr = ['TextView', 'ImageView'];
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
          mainAxisAlignment: getJustifyContent(mStyles),
          crossAxisAlignment: getAlignItems(mStyles),
          textDirection: getRowDirection(mStyles),
          children: childrenList);
    } else {
      return Row(
          mainAxisAlignment: getJustifyContent(mStyles),
          crossAxisAlignment: getAlignItems(mStyles),
          textDirection: getRowDirection(mStyles),
          children: children);
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
          mainAxisAlignment: getJustifyContent(mStyles),
          crossAxisAlignment: getAlignItems(mStyles),
          textDirection: TextDirection.ltr,
          verticalDirection: getDirection(mStyles),
          children: childrenList.map((e) => this.getRLChild(e)).toList());
    } else {
      return Column(
          mainAxisAlignment: getJustifyContent(mStyles),
          crossAxisAlignment: getAlignItems(mStyles),
          textDirection: TextDirection.ltr,
          verticalDirection: getDirection(mStyles),
          children: children);
    }
  }

  Widget renderFlex(Widget child) {
    return Flex(direction: getFlexDirection(mStyles), children: [child]);
  }

  Widget renderChildreTree(List<Widget> mTree) {
    Widget element = mStyles.flexDirection == 'row'
        ? this.renderRow(mTree)
        : this.renderColumn(mTree);
    return Container(
      child: element,
      width: double.infinity,
      height: double.infinity,
    );
  }

  List<Widget> renderChildren(List<Widget> children) {
    List<Widget> mAbsolute = [];
    List<Widget> mTree = [];
    List<Widget> mElement = [];
    children.forEach((element) {
      dynamic select = (element as dynamic);
      Type runtimeType = element.runtimeType;
      if (this.getAbsType(runtimeType, select)) {
        mAbsolute.add(element);
      } else {
        mTree.add(element);
      }
    });
    if (mTree.length > 0) {
      mElement.add(this.renderChildreTree(mTree));
    }
    mElement.addAll(mAbsolute);
    return mElement.toList();
  }

  renderStack(List<Widget> children) {
    return Stack(children: this.renderChildren(children));
  }

  renderContainer(Widget child) {
    return Container(
        margin: getMargin(mStyles),
        padding: getPadding(mStyles),
        width: mStyles.width != null ? getWidth(mStyles) : null,
        height: mStyles.height != null ? getHeight(mStyles) : null,
        decoration: getDecoration(mStyles),
        constraints: getContaionMaxMin(mStyles),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    if (mStyles.display == 'none') {
      return this.renderEmpty();
    } else if (this.children != null && this.children.length > 0) {
      return this.renderContainer(this.renderStack(this.children));
    } else {
      return this.renderContainer(null);
    }
  }
}
