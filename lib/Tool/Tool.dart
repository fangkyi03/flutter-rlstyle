import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:rlstyles/Component/HexColor.dart';
import 'package:rlstyles/Component/Styles.dart';
import 'package:rlstyles/Tool/base.dart';

// 获取wrap主轴方向
WrapCrossAlignment getWrapJustifyContent(styles) {
  if (styles.justifyContent != null) {
    switch (styles.justifyContent) {
      case 'flex-start':
        return WrapCrossAlignment.start;
      case 'center':
        return WrapCrossAlignment.center;
      case 'flex-end':
        return WrapCrossAlignment.end;
    }
  } else {
    return WrapCrossAlignment.start;
  }
}

// 获取主轴方向
MainAxisAlignment getJustifyContent(styles) {
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

// 获取次轴方向
CrossAxisAlignment getAlignItems(styles) {
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

// 获取次轴方向
WrapAlignment getWrapAlignItems(styles) {
  if (styles.alignItems != null) {
    switch (styles.alignItems) {
      case 'flex-start':
        return WrapAlignment.start;
      case 'center':
        return WrapAlignment.center;
      case 'flex-end':
        return WrapAlignment.end;
    }
  } else {
    return WrapAlignment.start;
  }
}

// 获取flex布局方向
getFlexDirection(styles) {
  if (styles.flexDirection != null) {
    if (styles.flexDirection == 'column-reverse') {
      return Axis.vertical;
    } else {
      return Axis.vertical;
    }
  } else {
    return Axis.vertical;
  }
}

// 获取方向
getDirection(styles) {
  if (styles.flexDirection != null) {
    if (styles.flexDirection == 'column-reverse') {
      return VerticalDirection.up;
    } else {
      return VerticalDirection.down;
    }
  } else {
    return VerticalDirection.down;
  }
}

// 判断当前方向
getRowDirection(styles) {
  if (styles.flexDirection != null) {
    if (styles.flexDirection == 'row-reverse') {
      return TextDirection.rtl;
    } else {
      return TextDirection.ltr;
    }
  } else {
    return TextDirection.ltr;
  }
}

// 判断是否是百分比布局
getPercentageState(styles) {
  if (getTypeOf(styles.width) == '%' || getTypeOf(styles.height) == '%') {
    return true;
  } else {
    return false;
  }
}

// 获取容器最大最小宽度
getContaionMaxMin(styles) {
  return BoxConstraints(
      minWidth: styles.minWidth != null
          ? styles.minWidth.toDouble()
          : getWidth(styles),
      minHeight: styles.minHeight != null
          ? styles.minHeight.toDouble()
          : getHeight(styles),
      maxWidth: styles.maxWidth != null
          ? styles.maxWidth.toDouble()
          : double.infinity,
      maxHeight: styles.maxHeight != null
          ? styles.maxHeight.toDouble()
          : double.infinity);
}

// 获取边框宽度
double getBorderWidth(styles) {
  if (styles.borderWidth != null) {
    return styles.borderWidth.toDouble();
  } else {
    return getSize(size: styles.borderLeftWidth) +
        getSize(size: styles.borderRightWidth);
  }
}

// 获取margin宽度
double getMarginWidth(styles) {
  return getSize(size: styles.marginLeft) + getSize(size: styles.marginRight);
}

// 获取margin高度
double getMarginHeight(styles) {
  return getSize(size: styles.marginTop) + getSize(size: styles.marginBottom);
}

// 获取padding宽度
double getPaddingWidth(styles) {
  return getSize(size: styles.paddingLeft) + getSize(size: styles.paddingRight);
}

// 获取padding高度
double getPaddingHeight(styles) {
  return getSize(size: styles.paddingTop) + getSize(size: styles.paddingBottom);
}

// 获取宽度
double getWidth(styles) {
  if (getTypeOf(styles.width) == '%') {
    return null;
  } else {
    return getSize(size: styles.width, defValue: 0.0);
  }
}

// 获取高度
double getHeight(styles) {
  if (getTypeOf(styles.height) == '%') {
    return null;
  } else {
    return getSize(size: styles.height, defValue: 0.0);
  }
}

// 获取double尺寸
double getDoubleSize({double size = 0, double defValue = 0.0}) {
  if (size != null) {
    return ScreenUtil().setWidth(size);
  } else {
    return defValue;
  }
}

// 获取padding
EdgeInsets getPadding(styles) {
  final newPadding = EdgeInsets.only(
      left: getSize(size: styles.paddingLeft, defValue: 0.0),
      top: getSize(size: styles.paddingTop, defValue: 0.0),
      right: getSize(size: styles.paddingRight, defValue: 0.0),
      bottom: getSize(size: styles.paddingBottom, defValue: 0.0));
  if (styles.padding != null) {
    return EdgeInsets.all(getSize(size:styles.padding,defValue: 0.0));
  } else if (!newPadding.isNonNegative) {
    return EdgeInsets.all(0);
  } else {
    return newPadding;
  }
}

// 获取margin
EdgeInsets getMargin(styles) {
  final newMargin = EdgeInsets.only(
      left: getSize(size: styles.marginLeft, defValue: 0.0),
      top: getSize(size: styles.marginTop, defValue: 0.0),
      right: getSize(size: styles.marginRight, defValue: 0.0),
      bottom: getSize(size: styles.marginBottom, defValue: 0.0));
  if (styles.margin != null) {
    return EdgeInsets.all(styles.margin);
  } else if (!newMargin.isNonNegative) {
    return EdgeInsets.all(0);
  } else {
    return newMargin;
  }
}

// 获取边框风格
BorderStyle getBorderStyle(String style) {
  if (style == null) return BorderStyle.none;
  switch (style) {
    case 'solid':
      return BorderStyle.solid;
    case 'none':
      return BorderStyle.none;
    default:
      return BorderStyle.solid;
  }
}

// 获取边框颜色
Color getBorderColor(styles) {
  if (styles.borderColor != null) {
    return HexColor(styles.borderColor);
  } else {
    return Colors.black;
  }
}

// 获取左侧边框
BorderSide getLeftBorder(styles) {
  if (styles.borderLeftColor != null &&
      styles.borderLeftWidth != null &&
      styles.borderLeftStyle != null) {
    return BorderSide(
        color: HexColor(styles.borderLeftColor),
        style: getBorderStyle(styles.borderLeftStyle),
        width: getSize(size: styles.borderLeftWidth));
  } else {
    return BorderSide.none;
  }
}

// 获取顶部边框
BorderSide getTopBorder(styles) {
  if (styles.borderTopWidth != null &&
      styles.borderTopStyle != null &&
      styles.borderTopColor != null) {
    return BorderSide(
        color: HexColor(styles.borderTopColor),
        style: getBorderStyle(styles.borderTopStyle),
        width: getSize(size: styles.borderTopWidth));
  } else {
    return BorderSide.none;
  }
}

// 获取右侧边框
BorderSide getRightBorder(styles) {
  if (styles.borderRightStyle != null &&
      styles.borderRightWidth != null &&
      styles.borderRightColor != null) {
    return BorderSide(
        color: HexColor(styles.borderRightColor),
        style: getBorderStyle(styles.borderRightStyle),
        width: getSize(size: styles.borderRightWidth));
  } else {
    return BorderSide.none;
  }
}

// 获取底部边框
BorderSide getBottomBorder(styles) {
  if (styles.borderBottomColor != null &&
      styles.borderBottomStyle != null &&
      styles.borderBottomWidth != null) {
    return BorderSide(
        color: HexColor(styles.borderBottomColor),
        style: getBorderStyle(styles.borderBottomStyle),
        width: getSize(size: styles.borderBottomWidth));
  } else {
    return BorderSide.none;
  }
}

// 获取边框
BoxBorder getBorder(styles) {
  if (styles.borderWidth != null &&
      styles.borderColor != null &&
      styles.borderStyle != null) {
    return Border.all(
        color: HexColor(styles.borderColor),
        style: getBorderStyle(styles.borderStyle),
        width: getSize(size: styles.borderWidth));
  } else {
    return Border(
        left: getLeftBorder(styles),
        top: getTopBorder(styles),
        right: getRightBorder(styles),
        bottom: getBottomBorder(styles));
  }
}

// 获取边框圆角
BorderRadius getBorderRadius(styles) {
  if (styles.borderRadius != null) {
    return BorderRadius.all(
        Radius.circular(getSize(size: styles.borderRadius)));
  } else if (styles.borderTopLeftRadius != null ||
      styles.borderBottomLeftRadius != null ||
      styles.borderBottomRightRadius != null ||
      styles.borderTopRightRadius != null) {
    return BorderRadius.only(
        topLeft: Radius.circular(getSize(size: styles.borderTopLeftRadius)),
        topRight: Radius.circular(getSize(size: styles.borderTopRightRadius)),
        bottomLeft:
            Radius.circular(getSize(size: styles.borderBottomLeftRadius)),
        bottomRight:
            Radius.circular(getSize(size: styles.borderBottomRightRadius)));
  } else {
    return null;
  }
}

// 获取背景颜色
getBackgroundColor(styles) {
  if (styles.backgroundColor != null &&
      getTypeOf(styles.backgroundColor) == 'String' &&
      (styles.backgroundColor as String).indexOf('linear-gradient') != -1) {
    return null;
  } else if (styles.backgroundColor != null) {
    return HexColor(styles.backgroundColor);
  } else {
    return null;
  }
}

// 百分比宽高
getPercentage({Widget childView, Styles styles}) {
  double mWidth;
  double mHeight;
  if (getTypeOf(styles.width) == '%') {
    mWidth = double.parse((styles.width as String).replaceAll('%', '')) / 100;
  }
  if (getTypeOf(styles.height) == '%') {
    mHeight = double.parse((styles.height as String).replaceAll('%', '')) / 100;
  }
  return FractionallySizedBox(
    widthFactor: mWidth ?? 0.0,
    heightFactor: mHeight ?? null,
    child: childView,
  );
}

// 设置边框
Decoration getDecoration(Styles styles) {
  return BoxDecoration(
      borderRadius: getBorderRadius(styles),
      color: getBackgroundColor(styles),
      border: getBorder(styles),
      gradient: getGradient(styles),
      boxShadow: getBoxShadow(styles));
}

// 获取渐变色
Gradient getGradient(styles) {
  if (styles.backgroundImage != null &&
      styles.backgroundImage.indexOf('linear-gradient') != -1) {
    return HexColor.getLineGradient(styles.backgroundImage);
  } else if (styles.backgroundColor != null &&
      getTypeOf(styles.backgroundColor) == 'String' &&
      (styles.backgroundColor as String).indexOf('linear-gradient') != -1) {
    return HexColor.getLineGradient(styles.backgroundColor);
  } else {
    return null;
  }
}

// 获取阴影
getListBoxShadow(styles) {
  return styles.boxShadow;
}

// 转换字符串阴影
BoxShadow tranStringBoxShadow(String item) {
  print(item.split(RegExp(r'(\\S+)')));
  return BoxShadow(
    offset: Offset(0, 1),
  );
}

// 获取字符串阴影
getLisStrigBoxShadow(styles) {
  return (styles.boxShadow as List<String>)
      .map((e) => tranStringBoxShadow(e))
      .toList();
}

// 获取边框阴影
getBoxShadow(styles) {
  if (styles.boxShadow != null) {
    switch (getTypeOf(styles.boxShadow)) {
      case 'List<BoxShadow>':
        return getListBoxShadow(styles);
      case 'List<String>':
        return getLisStrigBoxShadow(styles);
      case 'String':
        return tranStringBoxShadow(styles.boxShadow);
    }
  } else if (styles.elevation != null) {
    Color color = Colors.black.withOpacity(0.3);
    return [
      BoxShadow(
          offset: Offset(0, styles.elevation), color: color, blurRadius: 10)
    ];
  } else {
    return null;
  }
}
