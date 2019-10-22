import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

class Demo12 extends StatefulWidget {
  const Demo12({Key key,this.navigation}) : super(key: key);
  final NavigationOption navigation;

  @override
  _Demo12State createState() => _Demo12State();
}

class _Demo12State extends State<Demo12>  with TickerProviderStateMixin{

  @override 
  Widget build(BuildContext context) {
    return View(
      styles: styles['main'],
      children: <Widget>[
        View(
          styles: Styles(
            width: 400,
            height: 500,
            // flexDirection: 'row',
            backgroundColor: 'red'
          ),
          children: <Widget>[
            View(
              styles: Styles(
                width: '10%',
                height: 100,
                backgroundColor: 'blue'
              ),
            )
          ],
        )
      ]
    );
  }
}

const Map<String,Styles> styles = {
'main' :Styles(
  width: 750,
  height: 1330,
  position: 'rel',
  backgroundColor: 'white'
),
'bk':Styles(
  width: double.infinity,
  height: 400,
  backgroundColor: 'red'
),
'view':Styles(
  display: 'flex',
  flex: 1,
  paddingLeft: 20,
  paddingRight: 20,
  flexDirection: 'column'
),
'header':Styles(
  height: 60,
  paddingLeft: 20,
  paddingRight: 20,
  width: double.infinity,
  flexDirection: 'row',
  alignItems: 'center',
  justifyContent: 'space-between',
),
'search':Styles(
  marginLeft: 40,
  borderRadius: 20,
  height: 50,
  flex: 1,
  backgroundColor: 'rgba(0,0,0,0.5)',
  flexDirection: 'row',
  alignItems: 'center',
  paddingLeft: 20,
),
'card':Styles(
  width: '100%',
  marginTop: 200,
  height: 200,
  backgroundColor: 'white',
  elevation: 10,
  borderRadius: 20,
  flexWrap: 'wrap',
  position: 'rel'
),
'icon':Styles(
  width: '33%',
  height: 200,
  alignItems: 'center',
  flexDirection: 'column',
  justifyContent: 'center',
)
};