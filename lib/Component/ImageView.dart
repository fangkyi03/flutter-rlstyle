import 'package:flutter/material.dart';
import 'package:rlstyles/Tool/Tool.dart';
import 'package:rlstyles/main.dart';

// ignore: must_be_immutable
class ImageView extends StatelessWidget {
  ImageView({
    Key? key,
    this.styles,
    this.url = '',
    this.className,
    this.width,
    this.height,
    this.children = const [],
  }) : super(key: key) {
    mStyles = StylesMap.formMap(mergeStyle(this.styles));
  }
  final dynamic width;
  final dynamic height;
  final dynamic styles;
  // final BoxFit backgroundSize;
  Styles mStyles = Styles();
  final String url;
  final String? className;
  final List<Widget> children;

  BoxFit getImageFit() {
    return mStyles.backgroundSize;
  }

  renderImage() {
    if (url != '') {
      if (url.indexOf('http') != -1) {
        return Image.network(
          url,
          fit: getImageFit(),
          width: getSize(size: width ?? mStyles.width, defValue: null),
          height: getSize(size: height ?? mStyles.height, defValue: null),
        );
      } else {
        return Image.asset(
          url,
          fit: getImageFit(),
          width: getSize(size: width ?? mStyles.width, defValue: null),
          height: getSize(size: height ?? mStyles.height, defValue: null),
        );
      }
    } else {
      return Container();
    }
  }

  setStyle(dynamic newStyles) {}

  @override
  Widget build(BuildContext context) {
    return View(styles: styles, children: [
      ClipRRect(
          borderRadius:
              getBorderRadius(mStyles) ?? BorderRadius.all(Radius.circular(0)),
          child: renderImage())
    ]);
  }
}
