import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

class Demo11 extends StatefulWidget {
  const Demo11({Key key,this.navigation}) : super(key: key);
  final NavigationOption navigation;

  @override
  _Demo11State createState() => _Demo11State();
}

class _Demo11State extends State<Demo11>  with TickerProviderStateMixin{

  renderBk () {
    return View(
      styles: styles['bk'],
    );
  }

  renderLocationName () {
    return TextView(
      '杭州',
      styles: Styles(color: 'white'),
    );
  }

  renderSearch () {
    return View(
      styles: styles['search'],
      children: <Widget>[
        Icon(Icons.search,size: 20,color: Colors.white),
        TextView('请输入搜索内容',styles: Styles(color: 'white',fontSize: 20),)
      ],
    );
  }

  renderHeader () {
    return View(
      styles: styles['header'],
      children: <Widget>[
        renderLocationName(),
        renderSearch()
      ],
    );
  }

  renderView () {
    return View(
      styles: styles['view'],
      children: <Widget>[
        renderHeader(),
        renderIconGroup()
      ],
    );
  }

  Widget renderIcon (Map<String,dynamic> item) {
    return View(
      styles: styles['icon'],
      children: <Widget>[
        Icon(Icons.menu),
        TextView(item['name'])
      ],
    );
  }

  renderIconGroup () {
    List<Map<String,dynamic>> data = [
      {
        'name':'景区'
      },
      {
        'name':'测试'
      },
      {
        'name':'测试2'
      }
    ];
    return View(
      styles: styles['card'],
      children:data.map((f)=>renderIcon(f)).toList()
    );
  }

  @override 
  Widget build(BuildContext context) {
    return View(
      styles: styles['main'],
      children: <Widget>[
        renderBk(),
        renderView()
      ]
    );
  }
}

const Map<String,Styles> styles = {
'main' :Styles(
  width: double.infinity,
  height: double.infinity,
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