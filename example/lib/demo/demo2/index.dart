import 'package:flutter/material.dart';
import 'package:rlStyles/Router.dart';
import 'package:rlStyles/Styles.dart';
import 'package:rlStyles/View.dart';

class Demo2 extends StatelessWidget {

  const Demo2({Key key,this.navigation}) : super(key: key);
  final NavigationOption navigation;

  List<Widget> renderView () {
    List<dynamic> list = ['red','blue','yellow'];
    return list.map((e){
      return View(
        styles: Styles(
          flex: 1,
          backgroundColor: e
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return View(
      styles: styles['main'],
      children: [
        ...renderView()
      ]
    );
  }
}

const Map<String,Styles> styles = {
  'main':Styles(
    display: 'flex',
    flex: 1,
    flexDirection: 'column',
    backgroundColor: 'red'
  )
};