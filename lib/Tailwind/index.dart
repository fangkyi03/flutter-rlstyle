// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

// 合并所有样式
Map mergeStyle(List styles) {
  final obj = {};
  for (var style in styles) {
    obj.addAll(style);
  }
  return obj;
}

// row
const FL_FlexRow = {CssRule.flexDirection: 'row'};
const FL_FlexRowReverse = {CssRule.flexDirection: 'row-reverse'};

// column
const FL_FlexColumn = {CssRule.flexDirection: 'column'};
const FL_FlexColumnReverse = {CssRule.flexDirection: 'column-reverse'};

// wrap
const FL_FlexWrap = {CssRule.flexWrap: 'wrap'};
const FL_FlexNoWrap = {CssRule.flexWrap: 'nowrap'};

// Justify
const FL_JustifyStart = {CssRule.justifyContent: 'flex-start'};
const FL_JustifyCenter = {CssRule.justifyContent: 'center'};
const FL_JustifyEnd = {CssRule.justifyContent: 'flex-end'};
const FL_JustifyBetween = {CssRule.justifyContent: 'space-between'};
const FL_JustifyAround = {CssRule.justifyContent: 'space-around'};

// align
const FL_AlignStart = {CssRule.alignItems: 'flex-start'};
const FL_AlignCenter = {CssRule.alignItems: 'center'};
const FL_AlignEnd = {CssRule.alignItems: 'flex-end'};

// padding
final FL_Padding = ({dynamic size}) => {CssRule.padding: size};
final FL_PaddingLeft = ({dynamic size}) => {CssRule.paddingLeft: size};
final FL_PaddingRight = ({dynamic size}) => {CssRule.paddingRight: size};
final FL_PaddingTop = ({dynamic size}) => {CssRule.paddingTop: size};
final FL_PaddingBottom = ({dynamic size}) => {CssRule.paddingBottom: size};

// margin
final FL_Margin = ({dynamic size}) => {CssRule.margin: size};
final FL_MarginLeft = ({dynamic size}) => {CssRule.marginLeft: size};
final FL_MarginRight = ({dynamic size}) => {CssRule.marginRight: size};
final FL_MarginTop = ({dynamic size}) => {CssRule.marginTop: size};
final FL_MarginBottom = ({dynamic size}) => {CssRule.marginBottom: size};

// width
final FL_Width = ({dynamic size}) => {CssRule.width: size};
final FL_WFull = {CssRule.width: '100%'};

// height
final FL_Height = ({dynamic size}) => {CssRule.height: size};
final FL_HFull = {CssRule.height: '100%'};

// font
final FL_FWeight = ({dynamic size}) => {CssRule.fontWeight: size};
final FL_FFamily = ({dynamic size}) => {CssRule.fontFamily: size};

// fontSize
final FL_FSize = ({dynamic size}) => {CssRule.fontSize: size};
final FL_FSizeLg = {CssRule.fontSize: '20px'};
final FL_SizeSm = {CssRule.fontSize: '15px'};
final FL_FSizeXs = {CssRule.fontSize: '12px'};

// fontColor
final FL_Color = ({dynamic color}) => {CssRule.color: color};
final FL_ColorBlack = {CssRule.color: '#000'};
final FL_ColorWhite = {CssRule.color: '#fff'};
final FL_ColorRed = {CssRule.color: '#f00'};
final FL_ColorGreen = {CssRule.color: '#0f0'};
final FL_ColorBlue = {CssRule.color: '#00f'};

// radius
final FL_Radius = ({dynamic size}) => {CssRule.borderRadius: size};
final FL_RadiusLg = {CssRule.borderRadius: '5px'};
final FL_RadiusSm = {CssRule.borderRadius: '2px'};
final FL_RadiusXs = {CssRule.borderRadius: '1px'};
final FL_RadiusLeftTop =
    ({dynamic size}) => {CssRule.borderTopLeftRadius: size};
final FL_RadiusLeftBottom = ({dynamic size}) =>
    {CssRule.borderBottomLeftRadius: getSize(size: size, defValue: 0.0)};
final FL_RadiusRightTop = ({dynamic size}) =>
    {CssRule.borderTopRightRadius: getSize(size: size, defValue: 0.0)};
final FL_RadiusRightBottom = ({dynamic size}) =>
    {CssRule.borderBottomRightRadius: getSize(size: size, defValue: 0.0)};

// border
final FL_Border = ({dynamic size, dynamic color}) => {
      CssRule.borderWidth: size,
      CssRule.borderStyle: 'solid',
      CssRule.borderColor: color
    };

final FL_BorderBottom = ({
  dynamic size,
  dynamic color,
}) =>
    {
      CssRule.borderBottomWidth: size,
      CssRule.borderBottomColor: color,
      CssRule.borderBottomStyle: 'solid'
    };

final FL_BorderTop = ({
  dynamic width,
  dynamic color,
}) =>
    {
      CssRule.borderTopWidth: width,
      CssRule.borderTopColor: color,
      CssRule.borderTopStyle: 'solid'
    };

final FL_BorderLeft = ({
  dynamic width,
  dynamic color,
}) =>
    {
      CssRule.borderLeftWidth: width,
      CssRule.borderLeftColor: color,
      CssRule.borderLeftStyle: 'solid'
    };

final FL_BorderRight =
    ({dynamic width, dynamic color, String style = 'solid'}) => {
          CssRule.borderRightWidth: width,
          CssRule.borderRightColor: color,
          CssRule.borderRightStyle: style
        };

final FL_BorderColor = ({dynamic color}) => {CssRule.borderColor: color};

final FL_BorderLeftTop = ({dynamic size, dynamic color}) => {
      CssRule.borderLeftWidth: size,
      CssRule.borderLeftStyle: 'solid',
      CssRule.borderLeftColor: color
    };

final FL_BorderLeftBottom = ({dynamic size, dynamic color}) => {
      CssRule.borderLeftWidth: size,
      CssRule.borderLeftStyle: 'solid',
      CssRule.borderLeftColor: color
    };

final FL_BorderRightTop = ({dynamic size, dynamic color}) => {
      CssRule.borderRightWidth: size,
      CssRule.borderRightStyle: 'solid',
      CssRule.borderRightColor: color
    };

final FL_BorderRightBottom = ({dynamic size, dynamic color}) => {
      CssRule.borderRightWidth: size,
      CssRule.borderRightStyle: 'solid',
      CssRule.borderRightColor: color
    };

const FL_BorderSolid = {CssRule.borderStyle: 'solid'};

// backGroundColor
final FL_BgColor = ({dynamic color}) => {CssRule.backgroundColor: color};

// position
final FL_Absolute = {CssRule.position: 'abs'};
final FL_Relative = {CssRule.position: 'rel'};

// zIndex
final FL_ZIndex = ({dynamic index}) => {CssRule.zIndex: index};

// scroll
final FL_OverScrollY = {CssRule.overflowY: 'scroll'};
final FL_OverScrollX = {CssRule.overflowX: 'scroll'};

// flex
final FL_Flex = ({dynamic size}) => {CssRule.flex: size};

// size
final FL_MinWidth = ({dynamic size}) => {CssRule.minWidth: size};
final FL_MinHeight = ({dynamic size}) => {CssRule.minHeight: size};
final FL_MaxWidth = ({dynamic size}) => {CssRule.maxWidth: size};
final FL_MaxHeight = ({dynamic size}) => {CssRule.maxHeight: size};

// abs
final FL_AbsTop = ({dynamic size}) => {CssRule.top: size};
final FL_AbsLeft = ({dynamic size}) => {CssRule.left: size};
final FL_AbsRight = ({dynamic size}) => {CssRule.right: size};
final FL_AbsBottom = ({dynamic size}) => {CssRule.bottom: size};

// opacity
final FL_Opacity = ({dynamic size}) => {CssRule.opacity: size};

// backgroundSize
final FL_BgSize = ({dynamic size}) => {CssRule.backgroundSize: size};

// scrollBar
final FL_ScrollBar = ({dynamic state}) => {CssRule.scrollBar: state};

// backgroundImage
final FL_BgImage = ({dynamic size}) => {CssRule.backgroundImage: size};

// backgroungSize
final FL_BgSizeCover = {CssRule.backgroundSize: BoxFit.cover};
final FL_BgSizeContain = {CssRule.backgroundSize: BoxFit.contain};
final FL_BgSizeFill = {CssRule.backgroundSize: BoxFit.fill};
final FL_BgSizeFitHeight = {CssRule.backgroundSize: BoxFit.fitHeight};
final FL_BgSizeFitWidth = {CssRule.backgroundSize: BoxFit.fitWidth};
final FL_BgSizeScaleDown = {CssRule.backgroundSize: BoxFit.scaleDown};

// transform
final FL_Transform = ({dynamic matrix4}) => {CssRule.transform: matrix4};
