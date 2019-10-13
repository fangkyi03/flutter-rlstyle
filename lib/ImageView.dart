import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';
import './Tool.dart';
import './View.dart';
import './Styles.dart';

class ImageView extends StatelessWidget {
  const ImageView(
    {
      Key key, 
      this.styles = const Styles(), 
      this.url, 
      this.className,
      this.children = const []
    }
  ) 
  : super(key: key);
  final Styles styles;
  final dynamic url;
  final String className;
  final List<Widget> children;

  BoxFit getImageFit () {
    if (styles.backgroundSize != null ) {
      String type = getTypeOf(styles.backgroundSize);
      if (type == 'BoxFit') {
        return styles.backgroundSize;
      }else {
        switch (type) {
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
            return BoxFit.none;
        }
      }
    }else {
      return BoxFit.none;
    }
  }

  renderImage () {
    String type = getTypeOf(url);
    if (type == 'Image') {
      return url;
    }else if (type == 'String'){
      return Image.network(url,fit: getImageFit(),);
    }else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (styles == null ) return renderImage();
    return View(
      styles: styles,
      children: <Widget>[
        renderImage(),
        ...(children.length > 0 ? children : [])
      ]
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<String>('className', className,showName: true, expandableValue: true, defaultValue: null));
    properties.add(DiagnosticsProperty<Styles>('styles', styles,showName: true, defaultValue: null));
  }
}
