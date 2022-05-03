import 'package:rlstyles/Component/CssRule.dart';

// 合并所有样式
var mergeStyle = (List styles) {
  final obj = {};
  for (var style in styles) {
    obj.addAll(style);
  }
  return obj;
};

// row
const FlexRow = {CssRule.flexDirection: 'row'};
const FlexRowReverse = {CssRule.flexDirection: 'row-reverse'};

// column
const FlexColumn = {CssRule.flexDirection: 'column'};
const FlexColumnReverse = {CssRule.flexDirection: 'column-reverse'};

// wrap
const FlexWrap = {CssRule.flexWrap: 'wrap'};
const FlexNoWrap = {CssRule.flexWrap: 'nowrap'};

// Justify
const JustifyStart = {CssRule.justifyContent: 'flex-start'};
const JustifyCenter = {CssRule.justifyContent: 'center'};
const JustifyEnd = {CssRule.justifyContent: 'flex-end'};
const JustifyBetween = {CssRule.justifyContent: 'space-between'};
const JustifyAround = {CssRule.justifyContent: 'space-around'};

// align
const AlignStart = {CssRule.alignItems: 'flex-start'};
const AlignCenter = {CssRule.alignItems: 'center'};
const AlignEnd = {CssRule.alignItems: 'flex-end'};

// padding
final padding = ({dynamic size}) => {CssRule.padding: size};
final paddingLeft = ({dynamic size}) => {CssRule.paddingLeft: size};
final paddingRight = ({dynamic size}) => {CssRule.paddingRight: size};
final paddingTop = ({dynamic size}) => {CssRule.paddingTop: size};
final paddingBottom = ({dynamic size}) => {CssRule.paddingBottom: size};

// margin
final margin = ({dynamic size}) => {CssRule.margin: size};
final marginLeft = ({dynamic size}) => {CssRule.marginLeft: size};
final marginRight = ({dynamic size}) => {CssRule.marginRight: size};
final marginTop = ({dynamic size}) => {CssRule.marginTop: size};
final marginBottom = ({dynamic size}) => {CssRule.marginBottom: size};

// width
final width = ({dynamic size}) => {CssRule.width: size};
final wFull = {CssRule.width: '100%'};

// height
final height = ({dynamic size}) => {CssRule.height: size};
final hFull = {CssRule.height: '100%'};

// fontSize
final fSize = ({dynamic size}) => {CssRule.fontSize: size};
final fSizeLg = {CssRule.fontSize: '20px'};
final fSizeSm = {CssRule.fontSize: '15px'};
final fSizeXs = {CssRule.fontSize: '12px'};

// fontColor
final fColor = ({dynamic color}) => {CssRule.color: color};
final fColorBlack = {CssRule.color: '#000'};
final fColorWhite = {CssRule.color: '#fff'};
final fColorRed = {CssRule.color: '#f00'};
final fColorGreen = {CssRule.color: '#0f0'};
final fColorBlue = {CssRule.color: '#00f'};

// radius
final radius = ({dynamic size}) => {CssRule.borderRadius: size};
final radiusLg = {CssRule.borderRadius: '5px'};
final radiusSm = {CssRule.borderRadius: '2px'};
final radiusXs = {CssRule.borderRadius: '1px'};
final rLeftTop = {CssRule.borderTopLeftRadius: '5px'};
final rLeftBottom = {CssRule.borderBottomLeftRadius: '5px'};
final rRightTop = {CssRule.borderTopRightRadius: '5px'};
final rRightBottom = {CssRule.borderBottomRightRadius: '5px'};

// border
final border = ({dynamic size, dynamic color}) => {
      CssRule.borderWidth: size,
      CssRule.borderStyle: 'solid',
      CssRule.borderColor: color
    };
final bLeftTop = ({dynamic size, dynamic color}) => {
      CssRule.borderTopLeftRadius: size,
      CssRule.borderLeftWidth: size,
      CssRule.borderLeftStyle: 'solid',
      CssRule.borderLeftColor: color
    };
final bLeftBottom = ({dynamic size, dynamic color}) => {
      CssRule.borderBottomLeftRadius: size,
      CssRule.borderLeftWidth: size,
      CssRule.borderLeftStyle: 'solid',
      CssRule.borderLeftColor: color
    };
final bRightTop = ({dynamic size, dynamic color}) => {
      CssRule.borderTopRightRadius: size,
      CssRule.borderRightWidth: size,
      CssRule.borderRightStyle: 'solid',
      CssRule.borderRightColor: color
    };
final bRightBottom = ({dynamic size, dynamic color}) => {
      CssRule.borderBottomRightRadius: size,
      CssRule.borderRightWidth: size,
      CssRule.borderRightStyle: 'solid',
      CssRule.borderRightColor: color
    };

const borderSolid = {CssRule.borderStyle: 'solid'};

// backGroundColor
final bgColor = ({dynamic color}) => {CssRule.backgroundColor: color};
