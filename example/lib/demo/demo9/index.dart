import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

class Demo9 extends StatelessWidget {
  const Demo9({Key key,this.navigation}) : super(key: key);
  final NavigationOption navigation;
  @override
  Widget build(BuildContext context) {

    renderIcon (int index) {
      return TextView(
        index.toString(),
        styles:styles['icon'],
      );
    }

    renderIconGroup () {
      return View(
        styles: styles['iconGroup'],
        children:List(10).asMap().keys.map((e)=>renderIcon(e)).toList()
      );
    }

    return View(
      styles: styles['main'],
      children: <Widget>[
        renderIconGroup()
      ]
    );
  }

}

const Map<String,Styles> styles = {
'main' :Styles(
  width: double.infinity,
  height: double.infinity,
  flexDirection: 'column'
),
'iconGroup':Styles(
  flexWrap: 'wrap',
),
'icon':Styles(
  width: '33%',
  height: 200,
  backgroundColor: 'red',
  flexDirection: 'column',
  alignItems: 'center',
  justifyContent: 'center'
)
};