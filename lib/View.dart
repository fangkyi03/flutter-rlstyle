import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './ContainerView.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import './Tool.dart';
import './Styles.dart';

class View extends StatelessWidget {

  const View(
    {
      Key key,
      this.styles = const Styles(),
      this.onClick,
      this.children = const <Widget>[],
      this.jsonData,
      this.className,
      this.isHaveNative = false,
      this.type
    }
  ):super( key: key);
  final Styles styles;
  final GestureTapCallback onClick;
  final List<Widget> children;
  final Map<String, List<Widget>> jsonData;
  final String className;
  final bool isHaveNative;
  final String type;

  Widget createContainer(Widget child) {
    return ContainerView(
      styles: styles,
      child: child,
      onClick: onClick,
      className: className,
      type: type,
      children: children,
    );
  }

  MainAxisAlignment getJustifyContent() {
    if (styles.justifyContent != null) {
      switch (styles.justifyContent) {
        case 'flex-start':
          return MainAxisAlignment.start;
        case 'center':
          return MainAxisAlignment.center;
        case 'flex-end':
          return MainAxisAlignment.end;
        case 'space-arround':
          return MainAxisAlignment.spaceAround;
        case 'space-between':
          return MainAxisAlignment.spaceBetween;
        case 'space-evenly':
          return MainAxisAlignment.spaceEvenly;
        default:
          return MainAxisAlignment.start;
      }
    } else {
      return MainAxisAlignment.start;
    }
  }

  CrossAxisAlignment getAlignItems() {
    if (styles.alignItems != null) {
      switch (styles.alignItems) {
        case 'flex-start':
          return CrossAxisAlignment.start;
        case 'center':
          return CrossAxisAlignment.center;
        case 'flex-end':
          return CrossAxisAlignment.end;
        case 'stretch':
          return CrossAxisAlignment.stretch;
        default:
          return CrossAxisAlignment.start;
      }
    } else {
      return CrossAxisAlignment.start;
    }
  }

  getColumnDirection() {
    if (styles.flexDirection != null) {
      if (styles.flexDirection == 'column-reverse') {
        return VerticalDirection.up;
      }else {
        return VerticalDirection.down;
      }
    }else {
      return VerticalDirection.down;
    }
  }

  getRowDirection() {
    if (styles.flexDirection != null) {
      if (styles.flexDirection == 'row-reverse') {
        return TextDirection.rtl;
      }else {
        return TextDirection.ltr;
      }
    }else {
      return TextDirection.ltr;
    }
  }

  Widget renderColumn({List<Widget> childrenList}) {
    if (childrenList != null ) {
      return Column(
        mainAxisAlignment: getJustifyContent(),
        crossAxisAlignment: getAlignItems(),
        textDirection: TextDirection.ltr,
        verticalDirection:getColumnDirection(),
        children: childrenList
      );
    }else {
      return Column(
        mainAxisAlignment: getJustifyContent(),
        crossAxisAlignment: getAlignItems(),
        textDirection: TextDirection.ltr,
        verticalDirection:getColumnDirection(),
        children: children
      );
    }
  }

  Widget renderRow({List<Widget> childrenList}) {
    if (childrenList != null) {
      return Row(
        mainAxisAlignment: getJustifyContent(),
        crossAxisAlignment: getAlignItems(),
        textDirection: getRowDirection(),
        children: childrenList
      );
    } else {
      return Row(
        mainAxisAlignment: getJustifyContent(),
        crossAxisAlignment: getAlignItems(),
        textDirection: getRowDirection(),
        children: children
      );
    }
  }

  Widget createFlex({Widget child}) {
    if (styles.flex != null) {
      return Expanded(
        flex: styles.flex,
        child: child,
      );
    } else {
      return child;
    }
  }

  Widget createView() {
    // 因为row子无法显示 所以去除display判断
    if (styles.flexDirection == 'row' || styles.flexDirection == 'row-reverse') {
      return createContainer(renderRow());
    } else if (styles.flexDirection == 'column' || styles.flexDirection == 'column-reverse') {
      return createContainer(renderColumn());
    } else if (styles.display == 'none') {
      return Container(width: 0, height: 0);
    } else {
      return createContainer(renderRow());
    }
  }

  Widget renderColumnStack() {
    final Map<String, dynamic> filterData = filterChildrenPosition();
    if ((filterData['show'] as bool) == true) {
      final List<Widget> newChildren = [];
      newChildren.addAll(filterData['top']);
      if (filterData['body'].length > 0) {
        newChildren.add(createContainer(renderColumn(childrenList: filterData['body'])));
      }
      newChildren.addAll(filterData['foot']);
      return Stack(
        children: newChildren,
      );
    } else {
      return null;
    }
  }

  Widget renderRowStack() {
    final Map<String, dynamic> filterData = filterChildrenPosition();
    if ((filterData['show'] as bool) == true) {
      final List<Widget> newChildren = [];
      newChildren.addAll(filterData['top']);
      if (filterData['body'].length > 0) {
        newChildren.add(createContainer(renderRow(childrenList: filterData['body'])));
      }
      // id=2123修改先后顺序
      newChildren.addAll(filterData['foot']);
      return Stack(
        children: newChildren,
      );
    } else {
      return null;
    }
  }

  Map<String, dynamic> filterChildrenPosition() {
    final List<Widget> body = [];
    final List<Widget> top = [];
    final List<Widget> foot = [];
    bool isHaveRelative = false;
    children.forEach((dynamic e) {
      try {
        if (getTypeOf(e).indexOf('Positioned') != -1 || e.styles != null && (e.styles.position == 'absolute' || e.styles.position == 'abs') ) {
          if (isHaveRelative) {
            foot.add(e);
          } else {
            top.add(e);
          }
        } else {
          isHaveRelative = true;
          body.add(e);
        }
      } catch (el) {
        isHaveRelative = true;
        body.add(e);
      }
    });
    return {
      'top': top,
      'foot': foot,
      'body': body,
      'show': top.length > 0 || foot.length > 0 || body.length > 0
    };
  }

  Axis getWrapDirection () {
    if (styles.flexDirection != null ) {
      switch (styles.flexDirection) {
        case 'column':
          return Axis.vertical;
        case 'row':
          return Axis.horizontal;
        default:
          return Axis.horizontal;
      }
    }else {
      return Axis.horizontal;
    }
  }

  WrapAlignment getWrapAlignMent () {
    if (styles.justifyContent != null ) {
      switch (styles.justifyContent) {
        case 'flex-start':
          return WrapAlignment.start;
        case 'center':
          return WrapAlignment.center;
        case 'flex-end':
          return WrapAlignment.end;
        case 'space-between':
          return WrapAlignment.spaceBetween;
        case 'space-around':
          return WrapAlignment.spaceAround;
        case 'space-evenly':
          return WrapAlignment.spaceEvenly;
        default:
          return WrapAlignment.start;
      }
    }else {
      return WrapAlignment.start;
    }
  }

  WrapAlignment getWrapRunAlignment () {
    if (styles.alignItems != null ) {
      switch (styles.alignItems) {
        case 'flex-start':
          return WrapAlignment.start;
        case 'center':
          return WrapAlignment.center;
        case 'flex-end':
          return WrapAlignment.end;
        case 'space-between':
          return WrapAlignment.spaceBetween;
        case 'space-around':
          return WrapAlignment.spaceAround;
        case 'space-evenly':
          return WrapAlignment.spaceEvenly;
        default:
          return WrapAlignment.start;
      }
    }else {
      return WrapAlignment.start;
    }
  }

  Widget renderWrap () {
    return Wrap(
      direction: getWrapDirection(),
      alignment: getWrapAlignMent(),
      runAlignment: getWrapRunAlignment(),
      children: children,
    );
  }

  Widget renderColumnRow () {
    switch (styles.flexDirection) {
      case 'row':
        return renderRowStack();
      case 'column':
        return renderColumnStack();
      default:
        return Stack(children: children);
    }
  }

  Widget renderRelative() {
    if (styles.flexWrap != null && styles.flexWrap == 'wrap') {
      return createContainer(renderWrap());
    }else if (styles.flexDirection == null ) {
      return createContainer(Stack(children: children));
    } else {
      return createContainer(renderColumnRow());
    }
  }

  Widget renderPositionedChild() {
    // 因为绝对定位里面无法居中 去除child长度限制
    return createView();
    // if (children.length == 1) {
    //   return children[0];
    // } else {
    //   return 
    // }
  }

  Widget renderPositioned() {
    return Positioned(
        left: styles.left != null ? getSize(size: styles.left) : null,
        top: styles.top != null ? getSize(size: styles.top) : null,
        right: styles.right != null ? getSize(size: styles.right) : null,
        bottom: styles.bottom != null ? getSize(size: styles.bottom) : null,
        width: styles.width != null ? getSize(size: styles.width) : null,
        height: styles.height != null ? getSize(size: styles.height) : null ,
        child:Stack(children: <Widget>[renderPositionedChild()]) 
    );
  }

  Widget renderView() {
    switch (styles != null ? styles.position : '') {
      case 'rel':
      case 'relative':
        return renderRelative();
      case 'abs':
      case 'absolute':
        return renderPositioned();
      default:
        return createView();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    if (styles.display != null && styles.display == 'none') {
      return Container(width: 0, height: 0);
    }
    if (children != null && children.length == 1) {
      if (styles != null && styles.flexDirection == null && styles.position == null) {
        return createContainer(children[0]);
      } else if (styles.display == null && styles.flexDirection == null) {
        return createContainer(children[0]);
      } else {
        return renderView();
      }
    }
    return renderView();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<String>('className', className,
        showName: true, expandableValue: true, defaultValue: null));
    properties.add(DiagnosticsProperty<Styles>('styles', styles,
        showName: true, defaultValue: null));
  }
}
