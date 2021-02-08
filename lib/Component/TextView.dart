import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './View.dart';
import './HexColor.dart';
import '../Tool/base.dart';
import './Styles.dart';

class TextView extends StatelessWidget {
  const TextView(this.child,
      {Key key, this.styles, this.className, this.onClick})
      : super(key: key);
  final Styles styles;
  final String child;
  final String className;
  final GestureTapCallback onClick;

  FontWeight getWeight() {
    if (styles.fontWeight == null) return FontWeight.normal;
    if (getTypeOf(styles.fontWeight) == 'String' &&
        styles.fontWeight == 'bold') {
      return FontWeight.bold;
    }
    final double mfontWeight = getSize(size: styles.fontWeight);
    if (styles.fontWeight == null) {
      return FontWeight.normal;
    } else if (mfontWeight == 100.0) {
      return FontWeight.w100;
    } else if (mfontWeight == 200.0) {
      return FontWeight.w200;
    } else if (mfontWeight == 300.0) {
      return FontWeight.w300;
    } else if (mfontWeight == 400.0) {
      return FontWeight.w400;
    } else if (mfontWeight == 500.0) {
      return FontWeight.w500;
    } else if (mfontWeight == 600.0) {
      return FontWeight.w600;
    } else if (mfontWeight == 700.0) {
      return FontWeight.w700;
    } else if (mfontWeight == 800.0) {
      return FontWeight.w800;
    } else if (mfontWeight == 900.0) {
      return FontWeight.w900;
    } else {
      return FontWeight.normal;
    }
  }

  TextOverflow getOverFlow() {
    switch (styles.textOverflow) {
      case 'clip':
        return TextOverflow.clip;
      case 'ellipsis':
        return TextOverflow.ellipsis;
      case 'string':
        return TextOverflow.fade;
      default:
        return TextOverflow.visible;
    }
  }

  bool getSoftWrap() {
    switch (styles.whiteSpace) {
      case 'pre':
        return false;
      case 'nowrap':
        return false;
      case 'pre-wrap':
        return true;
      default:
        return true;
    }
  }

  double getLineHeight() {
    if (styles.lineHeight != null) {
      return double.parse(styles.lineHeight.replaceAll('px', ''));
    } else {
      return 0.0;
    }
  }

  TextDecoration getTextDecoration() {
    switch (styles.textDecoration) {
      case 'none':
        return TextDecoration.none;
      case 'overline':
        return TextDecoration.overline;
      case 'line-through':
        return TextDecoration.lineThrough;
      case 'underline':
        return TextDecoration.underline;
      default:
        return TextDecoration.none;
    }
  }

  TextAlign getTextAlign() {
    switch (styles.textAlign) {
      case 'start':
        return TextAlign.start;
      case 'left':
        return TextAlign.left;
      case 'center':
        return TextAlign.center;
      case 'right':
        return TextAlign.right;
      case 'justify':
        return TextAlign.start;
      default:
        return TextAlign.left;
    }
  }

  Widget renderText() {
    return Text(
      child,
      overflow: getOverFlow(),
      softWrap: getSoftWrap(),
      textAlign: getTextAlign(),
      style: TextStyle(
        letterSpacing: styles.letterSpacing,
        decoration: getTextDecoration(),
        // // height: getLineHeight(),
        color: HexColor(styles.color ?? '#FF000000'),
        fontFamily: styles.fontFamily,
        fontSize: styles.fontSize != null
            ? ScreenUtil().setSp(styles.fontSize)
            : ScreenUtil().setSp(16),
        fontWeight: getWeight(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // imgCook 案例 25文本无法居中
    if (styles != null) {
      return View(
        styles: styles,
        className: className,
        onClick: onClick,
        type: 'Text',
        children: [renderText()],
      );
    } else {
      return Text(child);
    }
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
