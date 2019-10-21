import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

class Demo10 extends StatefulWidget {
  const Demo10({Key key,this.navigation}) : super(key: key);
  final NavigationOption navigation;

  @override
  _Demo10State createState() => _Demo10State();
}

class _Demo10State extends State<Demo10>  with TickerProviderStateMixin{
  
  List<Widget> renderIndex () {
    final colorArr = ['blue','red','white','black','yellow'];
    return List(5).asMap().keys.map((int index){
      String color = colorArr[index];
      return View(
        styles: Styles(
          position: 'abs',
          top: (index * 10.0),
          width: 200,
          height: 200,
          backgroundColor: color,
          zIndex: index - 1
        )
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return View(
      styles: styles['main'],
      children: <Widget>[
        ...renderIndex()
      ]
    );
  }
}

const Map<String,Styles> styles = {
'main' :Styles(
  width: double.infinity,
  height: double.infinity,
  position: 'rel',
)
};