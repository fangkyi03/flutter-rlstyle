import 'package:flutter/material.dart';
import 'package:rlstyles/ImageView.dart';
import 'package:rlstyles/Router.dart';
import 'package:rlstyles/Styles.dart';
import 'package:rlstyles/TextView.dart';
import 'package:rlstyles/View.dart';

class Demo4 extends StatelessWidget {

  Demo4({Key key,this.navigation}) : super(key: key);
  final NavigationOption navigation;

  renderText () {
    return List(5).asMap().keys.map((index){
      return TextView('测试字体$index',styles: Styles(
        fontSize: index * 20.0,
        fontFamily: 'HanaleiFill',
        color: 'black'
      ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.red
      ),
      child: View(
        styles: styles['main'],
        children: [
          ...renderText()
        ]
      )
    );
  }
}

const Map<String,Styles> styles = {
  'main':Styles(
    display: 'flex',
    flex: 1,
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center',
    width: double.infinity,
    height: double.infinity,
    overflow: 'scroll'
  )
};