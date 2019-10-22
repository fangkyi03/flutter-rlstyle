import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1330);
    return View(
      styles: styles['main'],
      children: <Widget>[
        View(
          styles: Styles(width: '100%',backgroundColor: 'red',height: 600,position: 'grid',gridCount: 2,padding: 20),
          children: <Widget>[
            View(
              styles: Styles(backgroundColor: 'blue'),
              children: <Widget>[
                TextView('1')
              ],
            ),
            View(
              styles: Styles(backgroundColor: 'blue'),
              children: <Widget>[
                TextView('2')
              ],
            )
          ]
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
  backgroundColor: 'white',
  paddingTop: 200
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