import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';
import '../Tool/base.dart';
import './View.dart';
import './Styles.dart';

class ImageView extends StatelessWidget {
  ImageView(
      {Key? key,
      this.styles = const {},
      this.url = '',
      this.className,
      this.children = const []}) {
    this.mStyles = StylesMap.formMap(this.styles);
  }
  final Map styles;
  Styles mStyles = Styles();
  final String url;
  final String? className;
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
      if (url.indexOf('http') != -1) {
        return Image.network(
          url,
          fit: getImageFit(),
          width: getSize(size: mStyles.width, defValue: null),
          height: getSize(size: mStyles.height, defValue: null),
        );
      }
    } else {
      return Image.asset(
        url,
        fit: getImageFit(),
        width: getSize(size: mStyles.width, defValue: null),
        height: getSize(size: mStyles.height, defValue: null),
      );
    }
  }

  setStyle(Map newStyles) {}

  @override
  Widget build(BuildContext context) {
    return View(styles: styles, children: [renderImage()]);
  }
}
