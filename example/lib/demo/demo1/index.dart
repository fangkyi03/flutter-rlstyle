import 'package:flutter/material.dart';
import 'package:rlStyles/Router.dart';
import 'package:rlStyles/Styles.dart';
import 'package:rlStyles/View.dart';
class Demo1 extends StatelessWidget {

  const Demo1({this.navigation});
  final NavigationOption navigation;
  @override
  Widget build(BuildContext context) {

    renderView () {
      List<dynamic> colorArr = ['blue','red','#f55fff','rgba(255,12,13,1)','rgb(12,5,78)',Colors.red,Colors.black.withOpacity(0.5),'linear-gradient(blue,red)'];
      return View(
        styles: styles['wrap'],
        children: colorArr.map((f){
          return View(
            styles: Styles(
              width: 300,
              height: 300,
              marginTop: 50,
              marginLeft: 50,
              marginRight: 10,
              backgroundColor: f
            ),
          );
        }).toList(),
      );
    }

    return View(
      styles: styles['main'],
      children: <Widget>[
        renderView()
      ],
    );
  }
}

const Map<String,Styles> styles = {
  'main':Styles(
    flexDirection: 'column',
    backgroundColor: 'white',
    overflow: 'scroll',
    width: double.infinity,
    height: double.infinity
  ),
  'wrap':Styles(
    flexWrap: 'wrap'
  )
};