import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rlstyles/Component/StylesMap.dart';
import 'package:rlstyles/Tool/Tool.dart';
import 'package:rlstyles/main.dart';
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

  bool getTypeOf(runtimeType) {
    List<String> filterArr = ['TextView', 'ImageView', 'View'];
    return filterArr.indexOf(runtimeType.toString()) != -1;
  }

  getAbsType(Type runtimeType, dynamic select) {
    if (this.getTypeOf(runtimeType) &&
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
          mainAxisSize: MainAxisSize.min,
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
    if (mStyles.flex != null) {
      return Expanded(child: child, flex: mStyles.flex);
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
      crossAxisAlignment: getWrapJustifyContent(mStyles),
      alignment: getWrapAlignItems(mStyles),
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
    if (this.getTypeOf(child.runtimeType)) {
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
      if (this.getAbsType(runtimeType, select)) {
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
    return this.renderOpacity(Container(
        width: mStyles.width != null ? getWidth(mStyles) : null,
        height: mStyles.height != null ? getHeight(mStyles) : null,
        child: child));
  }

  renderContainer(Widget child) {
    return this.renderOpacity(Container(
        margin: getMargin(mStyles),
        padding: getPadding(mStyles),
        width: mStyles.width != null ? getWidth(mStyles) : null,
        height: mStyles.height != null ? getHeight(mStyles) : null,
        decoration: getDecoration(mStyles),
        constraints: getContaionMaxMin(mStyles),
        transform:
            Matrix4.translationValues(mStyles.marginLeft, mStyles.marginTop, 0),
        child: child));
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
        ...(this
            .getPositionZindex(childData['mAbsolute'])
            .map((e) => this.renderAbsolute(e))
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
      return this.renderEmpty();
    } else if (this.children != null && this.children.length > 0) {
      return this.renderFlex(renderGestureDetector(this.renderChildrenView()));
    } else {
      return this.renderFlex(renderGestureDetector(this.renderContainer(null)));
    }
  }
}
