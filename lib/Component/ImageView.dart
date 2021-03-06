import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';
import '../Tool/base.dart';
import './View.dart';
import './Styles.dart';

class ImageView extends StatelessWidget {
  ImageView(
      {Key key,
      this.styles,
      this.url,
      this.className,
      this.children = const []}) {
    this.mStyles = StylesMap.formMap(this.styles ?? {});
  }
  Map styles;
  Styles mStyles;
  final dynamic url;
  final String className;
  final List<Widget> children;

  BoxFit getImageFit() {
    if (mStyles.backgroundSize != null) {
      switch (mStyles.backgroundSize) {
        case 'contain':
          return BoxFit.contain;
        case 'cover':
          return BoxFit.cover;
        case 'fill':
          return BoxFit.fill;
        case 'fitHeight':
          return BoxFit.fitHeight;
        case 'fitWidth':
          return BoxFit.fitWidth;
        case 'scaleDown':
          return BoxFit.scaleDown;
        default:
          return BoxFit.contain;
      }
    } else {
      return BoxFit.contain;
    }
  }

  renderImage() {
    if (url != null) {
      if (url.runtimeType.toString() == 'String' &&
          (url as String).indexOf('http') != -1) {
        return Image.network(
          url,
          fit: getImageFit(),
        );
      }
    } else {
      return Image.asset(
        url,
        fit: getImageFit(),
      );
    }
  }

  setStyle(Map newStyles) {}

  @override
  Widget build(BuildContext context) {
    return View(styles: styles, children: [renderImage()]);
  }
}
