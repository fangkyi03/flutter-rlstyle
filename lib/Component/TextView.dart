import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rlstyles/Component/StylesMap.dart';
import './HexColor.dart';
import '../Tool/base.dart';
import './Styles.dart';

class TextView extends StatelessWidget {
  TextView(this.child, {Key key, this.styles, this.className, this.onClick}) {
    this.mStyles = StylesMap.formMap(this.styles ?? {});
  }
  Map<String, dynamic> styles;
  Styles mStyles;
  final String child;
  final String className;
  final GestureTapCallback onClick;

  FontWeight getWeight() {
    if (mStyles.fontWeight == null) return FontWeight.normal;
    if (getTypeOf(mStyles.fontWeight) == 'String' &&
        mStyles.fontWeight == 'bold') {
      return FontWeight.bold;
    }
    final double mfontWeight = getSize(size: mStyles.fontWeight);
    if (mStyles.fontWeight == null) {
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
    switch (mStyles.textOverflow) {
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
    switch (mStyles.whiteSpace) {
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
    if (mStyles.lineHeight != null) {
      return double.parse(mStyles.lineHeight.replaceAll('px', ''));
    } else {
      return 0.0;
    }
  }

  TextDecoration getTextDecoration() {
    switch (mStyles.textDecoration) {
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
    switch (mStyles.textAlign) {
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

  setStyle(Map newStyles) {
    Map obj = {...newStyles, ...styles ?? {}};
    mStyles = StylesMap.formMap(obj ?? {});
  }

  Widget renderText() {
    return Text(
      child,
      overflow: getOverFlow(),
      softWrap: getSoftWrap(),
      textAlign: getTextAlign(),
      style: TextStyle(
        letterSpacing: mStyles.letterSpacing,
        decoration: getTextDecoration(),
        // // height: getLineHeight(),
        color: HexColor(mStyles.color ?? '#FF000000'),
        fontFamily: mStyles.fontFamily,
        fontSize: mStyles.fontSize != null
            ? ScreenUtil().setSp(mStyles.fontSize)
            : ScreenUtil().setSp(16),
        fontWeight: getWeight(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return this.renderText();
  }
}
