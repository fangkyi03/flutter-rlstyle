import 'package:flutter/foundation.dart';


class Styles extends Diagnosticable {
  const Styles(
      {
      this.display = 'block',
      this.flexDirection,
      this.backgroundColor,
      this.backgroundImage,
      this.width,
      this.height,
      this.color,
      this.justifyContent,
      this.alignItems,
      this.borderRadius,
      this.marginLeft,
      this.marginTop,
      this.marginRight,
      this.marginBottom,
      this.paddingLeft,
      this.paddingTop,
      this.paddingRight,
      this.paddingBottom,
      this.left,
      this.top,
      this.right,
      this.bottom,
      this.position,
      this.maxHeight,
      this.maxWidth,
      this.fontSize,
      this.textOverflow,
      this.fontWeight,
      this.fontFamily,
      this.whiteSpace,
      this.lineHeight,
      this.textDecoration,
      this.overflow,
      this.lines,
      this.boxSizing,
      this.borderColor,
      this.borderStyle,
      this.borderWidth,
      this.opacity,
      this.boxShadow,
      this.textAlign,
      this.minHeight,
      this.minWidth,
      this.letterSpacing,
      this.borderBottomLeftRadius,
      this.borderBottomRightRadius,
      this.borderBottomColor,
      this.borderBottomStyle,
      this.borderBottomWidth,
      this.borderLeftColor,
      this.borderLeftStyle,
      this.borderLeftWidth,
      this.borderRightColor,
      this.borderRightStyle,
      this.borderRightWidth,
      this.borderTopColor,
      this.borderTopStyle,
      this.borderTopWidth,
      this.borderTopRightRadius,
      this.borderTopLeftRadius,
      this.flex,
      this.overflowX,
      this.overflowY,
      this.transform,
      this.flexWrap,
      this.backgroundSize,
      this.margin,
      this.padding
  });
  final String display;
  final dynamic color;
  final dynamic width;
  final dynamic height;
  final String flexDirection;
  final String flexWrap;
  final String justifyContent;
  final String alignItems;
  final double borderRadius;
  final double marginLeft;
  final double marginTop;
  final double marginRight;
  final double marginBottom;
  final double paddingLeft;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;
  final double left;
  final double top;
  final double right;
  final double bottom;
  final String position;
  final String backgroundImage;
  final dynamic backgroundColor;
  final double maxWidth;
  final double maxHeight;
  final double fontSize;
  final String textOverflow;
  final dynamic fontWeight;
  final String fontFamily;
  final String whiteSpace;
  final dynamic lineHeight;
  final String textDecoration;
  final String overflow;
  final int lines;
  final String boxSizing;
  final double borderWidth;
  final String borderStyle;
  final dynamic borderColor;
  final double opacity;
  final dynamic boxShadow;
  final String textAlign;
  final double minHeight;
  final double minWidth;
  final double borderBottomLeftRadius;
  final double borderBottomRightRadius;
  final String borderLeftStyle;
  final dynamic borderLeftColor;
  final double borderLeftWidth;
  final String borderRightStyle;
  final dynamic borderRightColor;
  final double borderRightWidth;
  final String borderTopStyle;
  final dynamic borderTopColor;
  final double borderTopWidth;
  final String borderBottomStyle;
  final dynamic borderBottomColor;
  final double borderBottomWidth;
  final double borderTopLeftRadius;
  final double borderTopRightRadius;
  final int flex;
  final String overflowY;
  final String overflowX;
  final double letterSpacing;
  final String transform;
  final dynamic backgroundSize;
  final double margin;
  final double padding;
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..defaultDiagnosticsTreeStyle = DiagnosticsTreeStyle.whitespace
      ..emptyBodyDescription = '<no decorations specified>';
      
    // flex
    properties.add(DiagnosticsProperty<String>('display',display));
    properties.add(DiagnosticsProperty<dynamic>('color',color));
    properties.add(DiagnosticsProperty<String>('flexDirection',flexDirection));
    properties.add(DiagnosticsProperty<String>('justifyContent',justifyContent));
    properties.add(DiagnosticsProperty<String>('alignItems',alignItems));
    properties.add(DiagnosticsProperty<int>('flex',flex));

    // box-size
    properties.add(DiagnosticsProperty<dynamic>('width',width));
    properties.add(DiagnosticsProperty<dynamic>('height',height));
    properties.add(DiagnosticsProperty<double>('maxWidth',maxWidth));
    properties.add(DiagnosticsProperty<double>('maxHeight',maxHeight));
    properties.add(DiagnosticsProperty<String>('boxSizing',boxSizing));
    properties.add(DiagnosticsProperty<double>('minHeight',minHeight));
    properties.add(DiagnosticsProperty<double>('minWidth',minWidth));

    // margin - padding
    properties.add(DiagnosticsProperty<double>('marginLeft',marginLeft));
    properties.add(DiagnosticsProperty<double>('marginTop',marginTop));
    properties.add(DiagnosticsProperty<double>('marginRight',marginRight));
    properties.add(DiagnosticsProperty<double>('marginBottom',marginBottom));
    properties.add(DiagnosticsProperty<double>('paddingLeft',paddingLeft));
    properties.add(DiagnosticsProperty<double>('paddingTop',paddingTop));
    properties.add(DiagnosticsProperty<double>('paddingRight',paddingRight));
    properties.add(DiagnosticsProperty<double>('paddingBottom',paddingBottom));

    //box 
    properties.add(DiagnosticsProperty<double>('opacity',opacity));

    // border
    properties.add(DiagnosticsProperty<double>('borderRadius',borderRadius));
    properties.add(DiagnosticsProperty<double>('borderWidth',borderWidth));
    properties.add(DiagnosticsProperty<String>('borderStyle',borderStyle));
    properties.add(DiagnosticsProperty<dynamic>('borderColor',borderColor));
    properties.add(DiagnosticsProperty<dynamic>('boxShadow',boxShadow));

    properties.add(DiagnosticsProperty<double>('borderBottomLeftRadius',borderBottomLeftRadius));
    properties.add(DiagnosticsProperty<double>('borderBottomRightRadius',borderBottomRightRadius));
    properties.add(DiagnosticsProperty<double>('borderTopLeftRadius',borderTopLeftRadius));
    properties.add(DiagnosticsProperty<double>('borderTopRightRadius',borderTopRightRadius));

    properties.add(DiagnosticsProperty<String>('borderLeftStyle',borderLeftStyle));
    properties.add(DiagnosticsProperty<dynamic>('borderLeftColor',borderLeftColor));
    properties.add(DiagnosticsProperty<double>('borderLeftWidth',borderLeftWidth));
    properties.add(DiagnosticsProperty<String>('borderRightStyle',borderRightStyle));
    properties.add(DiagnosticsProperty<dynamic>('borderRightColor',borderRightColor));
    properties.add(DiagnosticsProperty<double>('borderRightWidth',borderRightWidth));
    properties.add(DiagnosticsProperty<String>('borderTopStyle',borderTopStyle));
    properties.add(DiagnosticsProperty<dynamic>('borderTopColor',borderTopColor));
    properties.add(DiagnosticsProperty<double>('borderTopWidth',borderTopWidth));
    properties.add(DiagnosticsProperty<double>('borderBottomWidth',borderBottomWidth));
    properties.add(DiagnosticsProperty<dynamic>('borderBottomColor',borderBottomColor));
    properties.add(DiagnosticsProperty<String>('borderBottomStyle',borderBottomStyle));

    // postion 
    properties.add(DiagnosticsProperty<double>('left',left));
    properties.add(DiagnosticsProperty<double>('top',top));
    properties.add(DiagnosticsProperty<double>('right',right));
    properties.add(DiagnosticsProperty<double>('bottom',bottom));
    properties.add(DiagnosticsProperty<String>('position',position));

    // background
    properties.add(DiagnosticsProperty<String>('backgroundImage',backgroundImage));
    properties.add(DiagnosticsProperty<dynamic>('backgroundColor',backgroundColor));

    // font
    properties.add(DiagnosticsProperty<dynamic>('fontWeight',fontWeight));
    properties.add(DiagnosticsProperty<String>('fontFamily',fontFamily));
    properties.add(DiagnosticsProperty<double>('fontSize',fontSize));
    properties.add(DiagnosticsProperty<dynamic>('lineHeight',lineHeight));
    properties.add(DiagnosticsProperty<String>('textDecoration',textDecoration));
    properties.add(DiagnosticsProperty<String>('textOverflow',textOverflow));
    properties.add(DiagnosticsProperty<String>('whiteSpace',whiteSpace));
    properties.add(DiagnosticsProperty<String>('overflow',overflow));
    properties.add(DiagnosticsProperty<int>('lines',lines));
    properties.add(DiagnosticsProperty<String>('textAlign',textAlign));
    properties.add(DiagnosticsProperty<dynamic>('letterSpacing',letterSpacing));

    // scroll
    properties.add(DiagnosticsProperty<String>('overflow',overflow));
    properties.add(DiagnosticsProperty<String>('overflowY',overflowY));
    properties.add(DiagnosticsProperty<String>('overflowX',overflowX));
  }

  @override
  String toStringShort() => '$runtimeType';
}
