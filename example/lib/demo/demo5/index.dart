import 'package:flutter/material.dart';
import 'package:rlStyles/ImageView.dart';
import 'package:rlStyles/Router.dart';
import 'package:rlStyles/Styles.dart';
import 'package:rlStyles/TextView.dart';
import 'package:rlStyles/View.dart';

class Demo5 extends StatelessWidget {

  const Demo5({Key key,this.navigation}) : super(key: key);
  final NavigationOption navigation;

  renderScrollItem () {
    List<String> colorArr = ['red','blue','white','black','yellow'];
    return colorArr.map((e){
      return View(
        styles: Styles(
          width: 200,
          height: 200,
          backgroundColor: e
        ),
      );
    }).toList();
  }
  
  renderHorizontal () {
    return View(
      styles: Styles(
        backgroundColor: 'yellow',
        flexDirection: 'column',
      ),
      children: <Widget>[
        TextView('横向滚动',styles: Styles(fontSize: 50)),
        View(
          styles: styles['Horizontal'],
          children: renderScrollItem(),
        )
      ],
    );
  }

  renderVertical () {
   return View(
      styles: Styles(
        flexDirection: 'column',
        alignItems: 'center'
      ),
      children: <Widget>[
        TextView('垂直滚动',styles: Styles(fontSize: 50)),
        View(
          styles: styles['Vertical'],
          children: renderScrollItem(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return View(
      styles: styles['main'],
      children: [
        renderHorizontal(),
        renderVertical()
      ]
    );
  }
}

const Map<String,Styles> styles = {
  'main':Styles(
    display: 'flex',
    flex: 1,
    flexDirection: 'column',
    width: double.infinity,
    height: double.infinity,
    overflow: 'scroll'
  ),
  'Horizontal':Styles(
    width: double.infinity,
    height: 200,
    overflowX: 'scroll'
  ),
  'Vertical':Styles(
    flexDirection: 'column',
    overflow: 'scroll'
  )
};