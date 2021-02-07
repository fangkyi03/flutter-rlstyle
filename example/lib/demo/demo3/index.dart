import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

class Demo3 extends StatelessWidget {
  const Demo3({Key key, this.navigation}) : super(key: key);
  final NavigationOption navigation;

  List<Widget> renderView() {
    List<dynamic> list = ['black', 'red', 'yellow'];
    return list.map((e) {
      return View(
        styles: Styles(
            borderRadius: 100,
            width: 200,
            height: 200,
            backgroundColor: e,
            marginTop: 20),
      );
    }).toList();
  }

  renderImage() {
    List<dynamic> images = [
      Image.asset('assets/images/01.png', fit: BoxFit.cover),
      Image.network('http://rrd.me/eAdfm', fit: BoxFit.cover),
      'http://rrd.me/eAdfm'
    ];
    return images.map((f) {
      return ImageView(
        url: f,
        styles: Styles(
          width: 200,
          height: 200,
          borderRadius: 100,
          backgroundSize: BoxFit.cover,
          margin: 10,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return View(
        styles: styles['main'], children: [...renderView(), ...renderImage()]);
  }
}

const Map<String, Styles> styles = {
  'main': Styles(
      display: 'flex',
      flex: 1,
      flexDirection: 'column',
      alignItems: 'center',
      justifyContent: 'center',
      width: double.infinity,
      height: double.infinity,
      overflow: 'scroll')
};
