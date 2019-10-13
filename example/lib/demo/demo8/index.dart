import 'package:flutter/material.dart';
import 'package:rlStyles/main.dart';

class CustomClipPath extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.25, size.height - 50,size.width * 0.5 , size.height - 30);
    path.quadraticBezierTo(size.width * 0.75 , size.height - 0,size.width , size.height - 60 );
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class Demo8 extends StatefulWidget {

  const Demo8({this.navigation});
  final NavigationOption navigation;

  @override
  _Demo8State createState() => _Demo8State();
}

class _Demo8State extends State<Demo8> {

  int menuSelect = 0;
  int buttonSelect = 0;
  @override
  Widget build(BuildContext context) {

    renderHeaderView () {
      return ClipPath(
        clipper:CustomClipPath(),
        child: View(
          styles: styles['clip'],
        ),
      );
    }

    onSelect (index) {
      setState(() {
        menuSelect = index;
      });
    }

    renderPopMenu () {
      List<String> menu = [
        'test',
        'test1'
      ];
      return PopupMenuButton(
        child: View(
          styles: styles['menu'],
          children: <Widget>[
            TextView(menu[menuSelect],styles: Styles(color: 'white',fontSize: 50)),
            Icon(Icons.keyboard_arrow_down,color: Colors.white)
          ],
        ),
        onSelected: onSelect,
        itemBuilder: (BuildContext context)=> menu.asMap().keys.map((f){
          String item = menu[f];
          return PopupMenuItem(
            child: TextView(item),
            value: f,
          );
        }).toList(),
      );
    }

    renderMenu () {
      return View(
        styles: styles['menu'],
        children: <Widget>[
          IconButton(icon: Icon(Icons.location_on,color: Colors.white), onPressed: () {}),
          renderPopMenu(),
          View(
            styles: Styles(flex: 1,height: 50,flexDirection: 'row',justifyContent: 'flex-end',paddingRight: 30),
            children: <Widget>[
              Icon(Icons.settings,color: Colors.white)
            ],
          )
        ],
      );
    }

    renderHeaderSearch () {
      return View(
        styles: styles['headerSearch'],
        children: <Widget>[
          TextView('Where would',styles: Styles(color: 'white',fontSize: 50)),
          TextView('you want to go?',styles: Styles(color: 'white',fontSize: 50)),
          View(
            styles: styles['inputSearcg'],
            children: <Widget>[ 
              TextView('New ork City (JFK)'),
              View(
                styles: styles['search'],
                children: <Widget>[
                  Icon(Icons.search)
                ]
              )
            ]
          )
        ],
      );
    } 

    onButtonItem (index) {
      setState(() {
        buttonSelect = index;
      });
    }

    renderButtonItem (int index,List<Map<String,dynamic>> data) {
      Map<String,dynamic> item = data[index];
      bool isSelect = index == buttonSelect;
      return View(
        onClick: ()=>onButtonItem(index),
        styles: isSelect ? styles['selectButtonItem']:styles['buttonItem'],
        children: <Widget>[
          item['icon'],
          TextView(item['name'],styles: Styles(color: 'white',marginLeft: 10,fontSize: 25))
        ],
      );
    }

    renderHeaderButton () {
      List<Map<String,dynamic>> data = [
        {
          'name':'Fights',
          'icon':Icon(Icons.flight_takeoff,color: Colors.white)
        },
        {
          'name':'Hotels',
          'icon':Icon(Icons.hotel,color: Colors.white)
        }
      ];
      return View(
        styles: styles['headerButtonGroup'],
        children: data.asMap().keys.map((e)=>renderButtonItem(e,data)).toList(),
      );
    }

    renderHeader () {
      return View(
        styles: styles['header'],
        children: <Widget>[
          renderMenu(),
          renderHeaderSearch(),
          renderHeaderButton()
        ],
      );
    }

    renderView () {
      return View(
        styles: styles['view'],
        children: <Widget>[
          renderHeader(),
        ]
      );
    }

    return View(
      styles: styles['main'],
      children: <Widget>[
        renderHeaderView(),
        renderView()
      ],
    );
  }
}

const Map<String,Styles> styles = {
  'main':Styles(
    position: 'rel',
    flexDirection: 'column',
    backgroundColor: 'white',
    // overflow: 'scroll',
    width: double.infinity,
    height: double.infinity,
  ),
  'clip':Styles(
    height: 600,
    width: double.infinity,
    backgroundColor: 'blue',
  ),
  'header':Styles(
    height: 500,
    flexDirection: 'column',
    alignItems: 'center'
  ),
  'view':Styles(
    position: 'abs',
    left: 0,
    right: 0,
    top: 0,
    bottom: 0,
    flexDirection: 'column',
    // backgroundColor: 'red',
    overflow: 'scroll'
  ),
  'menu':Styles(
    flexDirection: 'row',
    alignItems: 'center',
    height: 100
  ),
  'headerSearch':Styles(
    flex: 1,
    width: double.infinity,
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center',
  ),
  'inputSearcg':Styles(
    width:400,
    height: 60,
    borderRadius: 30,
    backgroundColor: 'white',
    marginTop: 50,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingLeft: 20,
    elevation: 5
  ),
  'search':Styles(
    width: 60,
    height: 60,
    borderRadius: 30,
    elevation: 5,
    backgroundColor: 'white'
  ),
  'headerButtonGroup':Styles(
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    width: 400,
  ),
  'selectButtonItem':Styles(
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    marginRight: 10,
    height: 60,
    padding: 5,
    backgroundColor: 'rgba(255,255,255,0.6)',
    borderRadius: 30,
    width: 150
  ),
  'buttonItem':Styles(
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    marginRight: 10,
    height: 60,
    padding: 5,
        width: 150
  )
};