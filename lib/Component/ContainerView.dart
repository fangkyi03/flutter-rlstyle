// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import './HexColor.dart';
// import './ScrollView.dart';
// import './Styles.dart';
// import '../Tool/base.dart';

// class ContainerView extends StatelessWidget {
//   const ContainerView(
//       {Key key,
//       this.styles = const Styles(),
//       this.child,
//       this.children,
//       this.className,
//       this.onClick,
//       this.type = 'View',
//       this.isChild})
//       : super(key: key);

//   final Styles styles;
//   final Widget child;
//   final String className;
//   final GestureTapCallback onClick;
//   final String type;
//   final List<Widget> children;
//   final bool isChild;

//   getListBoxShadow() {
//     return styles.boxShadow;
//   }

//   BoxShadow tranStringBoxShadow(String item) {
//     print(item.split(RegExp(r'(\\S+)')));
//     return BoxShadow(
//       offset: Offset(0, 1),
//     );
//   }

//   getLisStrigBoxShadow() {
//     return (styles.boxShadow as List<String>)
//         .map((e) => tranStringBoxShadow(e))
//         .toList();
//   }

//   getBoxShadow() {
//     if (styles.boxShadow != null) {
//       switch (getTypeOf(styles.boxShadow)) {
//         case 'List<BoxShadow>':
//           return getListBoxShadow();
//         case 'List<String>':
//           return getLisStrigBoxShadow();
//         case 'String':
//           return tranStringBoxShadow(styles.boxShadow);
//       }
//     } else if (styles.elevation != null) {
//       Color color = Colors.black.withOpacity(0.3);
//       return [
//         BoxShadow(
//             offset: Offset(0, styles.elevation), color: color, blurRadius: 10)
//       ];
//     } else {
//       return null;
//     }
//   }

//   Decoration getDecoration() {
//     final Decoration decoration = BoxDecoration(
//         borderRadius: getBorderRadius(),
//         color: getBackgroundColor(),
//         border: isChild ? null : getBorder(),
//         gradient: getGradient(),
//         boxShadow: getBoxShadow());
//     return decoration;
//   }

//   getDirection(String direction) {
//     switch (direction) {
//       case 'top':
//         return Alignment.bottomLeft;
//       case 'left':
//         return Alignment.bottomLeft;
//     }
//   }

//   Gradient getGradient() {
//     if (styles.backgroundImage != null &&
//         styles.backgroundImage.indexOf('linear-gradient') != -1) {
//       return HexColor.getLineGradient(styles.backgroundImage);
//     } else if (styles.backgroundColor != null &&
//         getTypeOf(styles.backgroundColor) == 'String' &&
//         (styles.backgroundColor as String).indexOf('linear-gradient') != -1) {
//       return HexColor.getLineGradient(styles.backgroundColor);
//     } else {
//       return null;
//     }
//   }

//   Axis getScrollDirection() {
//     if (styles.overflow != null && styles.overflow == 'scroll') {
//       return Axis.vertical;
//     }
//     if (styles.overflowY != null && styles.overflowY == 'scroll') {
//       return Axis.vertical;
//     }
//     if (styles.overflowX != null && styles.overflowX == 'scroll') {
//       return Axis.horizontal;
//     }
//     return Axis.vertical;
//   }

//   bool getScrollState() {
//     if (styles.overflow != null && styles.overflow == 'scroll') {
//       return true;
//     } else if (styles.overflowX != null && styles.overflowX == 'scroll') {
//       return true;
//     } else if (styles.overflowY != null && styles.overflowY == 'scroll') {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   Widget renderChildren(child) {
//     if (getScrollState()) {
//       return ScrollViewContainer(
//         scrollDirection: getScrollDirection(),
//         children: <Widget>[child],
//       );
//     } else {
//       return type != null && type == 'Text' ? renderRowColumn() : child;
//     }
//   }

//   getPercentageState() {
//     if (getTypeOf(styles.width) == '%' || getTypeOf(styles.height) == '%') {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   getContaionMaxMin() {
//     if (getPercentageState()) {
//       return null;
//     } else {
//       return BoxConstraints(
//           minWidth:
//               styles.minWidth != null ? styles.minWidth.toDouble() : getWidth(),
//           minHeight: styles.minHeight != null
//               ? styles.minHeight.toDouble()
//               : getHeight(),
//           maxWidth: styles.maxWidth != null
//               ? styles.maxWidth.toDouble()
//               : double.infinity,
//           maxHeight: styles.maxHeight != null
//               ? styles.maxHeight.toDouble()
//               : double.infinity);
//     }
//   }

//   getContainer({Widget childView}) {
//     return Container(
//         margin: getMargin(),
//         padding: getPadding(),
//         width: styles.width != null ? getWidth() : null,
//         height: styles.height != null ? getHeight() : null,
//         decoration: getDecoration(),
//         constraints: getContaionMaxMin(),
//         child: renderChildren(childView ?? child));
//   }

//   getPercentage({Widget childView}) {
//     double mWidth;
//     double mHeight;
//     if (getTypeOf(styles.width) == '%') {
//       mWidth = double.parse((styles.width as String).replaceAll('%', '')) / 100;
//     }
//     if (getTypeOf(styles.height) == '%') {
//       mHeight =
//           double.parse((styles.height as String).replaceAll('%', '')) / 100;
//     }
//     return FractionallySizedBox(
//       widthFactor: mWidth ?? 0.0,
//       heightFactor: mHeight ?? null,
//       child: getContainer(childView: childView ?? child),
//     );
//   }

//   getHaveGesture() {
//     if (onClick != null) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   Widget renderView({Widget childView}) {
//     if (getHaveGesture()) {
//       return GestureDetector(
//           onTap: onClick,
//           child: getPercentageState()
//               ? getPercentage(childView: childView)
//               : getContainer(childView: childView));
//     } else {
//       return getPercentageState()
//           ? getPercentage(childView: childView)
//           : getContainer(childView: childView);
//     }
//   }

//   MainAxisAlignment getJustifyContent() {
//     if (styles.justifyContent != null) {
//       switch (styles.justifyContent) {
//         case 'flex-start':
//           return MainAxisAlignment.start;
//         case 'center':
//           return MainAxisAlignment.center;
//         case 'flex-end':
//           return MainAxisAlignment.end;
//         case 'space-arround':
//           return MainAxisAlignment.spaceAround;
//         case 'space-between':
//           return MainAxisAlignment.spaceBetween;
//         case 'space-evenly':
//           return MainAxisAlignment.spaceEvenly;
//         default:
//           return MainAxisAlignment.start;
//       }
//     } else {
//       return MainAxisAlignment.start;
//     }
//   }

//   CrossAxisAlignment getAlignItems() {
//     if (styles.alignItems != null) {
//       switch (styles.alignItems) {
//         case 'flex-start':
//           return CrossAxisAlignment.start;
//         case 'center':
//           return CrossAxisAlignment.center;
//         case 'flex-end':
//           return CrossAxisAlignment.end;
//         case 'stretch':
//           return CrossAxisAlignment.stretch;
//         default:
//           return CrossAxisAlignment.start;
//       }
//     } else {
//       return CrossAxisAlignment.start;
//     }
//   }

//   getColumnDirection() {
//     if (styles.flexDirection != null) {
//       if (styles.flexDirection == 'column-reverse') {
//         return VerticalDirection.up;
//       } else {
//         return VerticalDirection.down;
//       }
//     } else {
//       return VerticalDirection.down;
//     }
//   }

//   getRowDirection() {
//     if (styles.flexDirection != null) {
//       if (styles.flexDirection == 'row-reverse') {
//         return TextDirection.rtl;
//       } else {
//         return TextDirection.ltr;
//       }
//     } else {
//       return TextDirection.ltr;
//     }
//   }

//   Widget renderColumn({List<Widget> childrenList}) {
//     return Column(
//         mainAxisAlignment: getJustifyContent(),
//         crossAxisAlignment: getAlignItems(),
//         textDirection: TextDirection.ltr,
//         verticalDirection: getColumnDirection(),
//         children: childrenList ?? [child]);
//   }

//   Widget renderRow({List<Widget> childrenList}) {
//     return Row(
//         mainAxisAlignment: getJustifyContent(),
//         crossAxisAlignment: getAlignItems(),
//         textDirection: getRowDirection(),
//         children: childrenList ?? [child]);
//   }

//   Widget renderRowColumn() {
//     if (styles.flexDirection == null) return child;
//     switch (styles.flexDirection) {
//       case 'row':
//         return renderRow();
//       case 'column':
//         return renderColumn();
//       default:
//         return child;
//     }
//   }

//   Widget renderElevation({Widget childView}) {
//     return childView;
//   }

//   Widget renderClipBorderRadius() {
//     return renderView(
//         childView: ClipRRect(borderRadius: getBorderRadius(), child: child));
//   }

//   Widget renderOpacity(Widget child) {
//     if (styles.opacity != null) {
//       return Opacity(
//         opacity: styles.opacity,
//         child: child,
//       );
//     } else {
//       return child;
//     }
//   }

//   getFlexDirection() {
//     if (styles.flexDirection != null) {
//       switch (styles.flexDirection) {
//         case 'row':
//           return Axis.horizontal;
//         case 'column':
//           return Axis.vertical;
//       }
//     } else {
//       return Axis.vertical;
//     }
//   }

//   Widget renderFlex(Widget child) {
//     if (styles.display != null &&
//         styles.display == 'flex' &&
//         styles.flex != null) {
//       return Flex(
//         direction: getFlexDirection(),
//         children: <Widget>[Expanded(flex: styles.flex ?? 1, child: child)],
//       );
//     } else if (styles.flex != null) {
//       return Expanded(flex: styles.flex ?? 1, child: child);
//     } else {
//       return child;
//     }
//   }

//   renderScroll(Widget item) {
//     if (getScrollState()) {
//       return ScrollViewContainer(
//         scrollDirection: getScrollDirection(),
//         children: children,
//       );
//     } else {
//       return item;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget child;
//     if (styles.borderRadius != null) {
//       child = renderClipBorderRadius();
//     } else {
//       child = renderView();
//     }
//     return renderOpacity(renderFlex(child));
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(DiagnosticsProperty<String>('className', className,
//         showName: true, expandableValue: true, defaultValue: null));
//     properties.add(DiagnosticsProperty<Styles>('styles', styles,
//         showName: true, defaultValue: null));
//   }
// }
