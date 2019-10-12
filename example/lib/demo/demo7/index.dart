import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rlStyles/Router.dart';
import 'package:rlStyles/Styles.dart';
import 'package:rlStyles/View.dart';
import 'package:rlStyles/main.dart';

class Demo7 extends StatefulWidget {

  const Demo7({Key key,this.navigation}) : super(key: key);
  final NavigationOption navigation;

  @override
  _Demo7State createState() => _Demo7State();
}

class _Demo7State extends State<Demo7> with SingleTickerProviderStateMixin {

  Animation process;
  AnimationController animationController;
  int selectFirend = 0;
  @override
  void initState() { 
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 2));
    process = Tween<double>(begin: 0.0,end: 1.0).animate(animationController);
    animationController.forward();
  }

  renderSvg () {
    return View(
      styles: styles['svg'],
      children: <Widget>[
        SvgPicture.asset(
          'assets/images/stadia_logo.svg',
          color: Color(0XFFFCE3E0),
          width: 300,
        )
      ],
    );
  }

  onSearch () {

  }

  renderHeader () {
    List<Map<String,dynamic>> menu = [
      {
        'icon':Icons.menu
      },
      {
        'icon':Icons.search,
        'onClick':onSearch
      }
    ];
    return View(
      styles: styles['menu'],
      children: menu.map((e){
        return IconButton(
          icon: Icon(e['icon']),
          onPressed: ()=>e['onClick'] && e['onClick'](),
        );
      }).toList()
    );
  }

  renderUserLogo () {
    return View(
      styles: styles['logo'],
      children: <Widget>[
        ImageView(
          url: Image.asset('assets/images/gena_sedgwick.jpg',fit: BoxFit.cover),
          styles: styles['logoImage'],
        ),
        TextView(
          '39',
          styles: styles['logoText'],
        )
      ],
    );
  }

  renderUserName () {
    return TextView(
      'Hello\nJon Snow',
      styles: Styles(
        fontSize: 50,
        marginLeft: 30
      ),
    );
  }

  renderUserInfo () {
    return View(
      styles: styles['userInfo'],
      children: <Widget>[
        renderUserLogo(),
        renderUserName()
      ],
    );
  }

  renderCard () {
    return View(
      styles: styles['card'],
      children: <Widget>[
        TextView('HOURS PLAYED',styles: Styles(fontSize: 30,color: 'black',fontWeight: 'bold')),
        TextView('297 HOURS',styles: Styles(fontSize: 30,color: 'red',fontWeight: 'bold'))
      ],
    );
  }

  Widget renderListItem (Map<String,dynamic> item) {
    return View(
      styles: styles['listItem'],
      children: <Widget>[
        ImageView(url: Image.asset(item['image']),styles: Styles(borderRadius: 10),),
        View(
          styles: Styles(flexDirection: 'column',marginLeft: 10,width: 300),
          children: <Widget>[
            TextView(item['name']),
            TextView((item['current'] * 100).toString() + 'Player')
          ],
        ),
        View(
          styles: Styles(flex: 1,flexDirection: 'column',alignItems: "center",justifyContent: 'center'),
          children: <Widget>[
            View(
              styles: Styles(position: 'rel'),
              children: <Widget>[
                View(
                  styles: styles['process'],
                ),
                View(
                  styles: Styles(
                    width: process.value * 200 * item['current'],
                    height: 30,
                    borderRadius: 15,
                    backgroundColor: 'red',
                    flexDirection: null
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }

  renderList () {
    List<Map<String,dynamic>> data = [
      {
        'name':'Assassin\'s Creed Odyssey',
        'current':0.2,
        'image':'assets/demo7/apex_legends.jpg'
      },
      {
        'name':'Dead Cells',
        'current':0.8,
        'image':'assets/demo7/assassins_creed_odyssey.jpg'
      },
      {
        'name':'tardew Valley',
        'current':0.95,
        'image':'assets/demo7/dead_cells.jpg'
      },
      {
        'name':'No Man\'s Sky',
        'current':0.1,
        'image':'assets/demo7/fortnite.jpg'
      }          
    ];
    return View(
      styles: styles['list'],
      children: data.map((e)=>renderListItem(e)).toList(),
    );
  }

  onSelectFirend (index) {
    setState(() {
      selectFirend = index;
    });
  }

  Widget renderLogo (int index,List<Map<String,dynamic>> data) {
    Map<String,dynamic> item  = data[index];
    bool isSelect = selectFirend == index;
    return View(
      styles:styles['firendLogo'],
      onClick: ()=>onSelectFirend(index),
      children: <Widget>[
        ImageView(url: item['logo'],styles: Styles(borderRadius: 50,width: 100,height: 100,borderColor: isSelect ? 'red': null,borderStyle: 'solid',borderWidth: 3)),
        TextView(item['name'],styles:Styles(fontSize: 30,color: 'black'))
      ],
    );
  }
  
  renderFirend () {
    List<Map<String,dynamic>> data = [
      {
        'name':'Sansa',
        'logo':Image.asset('assets/demo7/gena_sedgwick.jpg',fit: BoxFit.cover,)
      },
      {
        'name':'Arya',
        'logo':Image.asset('assets/demo7/jeenie_duhe.jpg',fit: BoxFit.cover,)
      },
      {
        'name':'Daenerys',
        'logo':Image.asset('assets/demo7/michelle_chong.jpg',fit: BoxFit.cover,)
      },
      {
        'name':'Tryion',
        'logo':Image.asset('assets/demo7/trish_ammons.jpg',fit: BoxFit.cover,)
      }
    ];
    return View(
      styles:Styles(flexDirection: 'column',marginTop: 50),
      children: <Widget>[
        TextView('Firend',styles: Styles(fontWeight: 'bold',fontSize: 30)),
        View(
          styles: styles['firend'],
          children: [
            ...data.asMap().keys.map((e)=>renderLogo(e,data)).toList()
          ],
        )
      ],
    );
  }
  
  renderBody () {
    return View(
      styles: styles['body'],
      children: <Widget>[
        renderUserInfo(),
        renderCard(),
        renderList(),
        renderFirend()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext contenxt,Widget child){
        return  View(
          styles: styles['main'],
          children: [
            renderSvg(),
            renderHeader(),
            renderBody()
          ]
        );
      }
    );
  }
}

const Map<String,Styles> styles = {
  'main':Styles(
    width: double.infinity,
    flexDirection: 'column',
    position: 'rel',
  ),
  'svg':Styles(
    position: 'abs',
    right: -150,
    top: -50,
    width: 500,
    height: 500,
  ),
  'menu':Styles(
    flexDirection: 'row',
    alignItems: 'center',
    height: 50,
    justifyContent: 'space-between'
  ),
  'body':Styles(
    paddingLeft: 20,
    paddingRight: 20,
    flexDirection: 'column'
  ),
  'userInfo':Styles(
    flexDirection: 'row',
    alignItems: 'center',
    marginTop: 50
  ),
  'logo':Styles(
    position: 'rel',
    width: 200,
    height: 200,
    flexDirection: 'column',
    // backgroundColor: 'red'
  ),
  'logoImage':Styles(
    width: 200,
    height: 200,
    borderRadius: 100,
    borderColor: 'red',
    borderStyle: 'solid',
    borderWidth: 5
  ),
  'logoText':Styles(
    position: 'abs',
    right: 10,
    bottom: 0,
    width: 60,
    height: 60,
    fontSize: 30,
    borderRadius: 30,
    color: 'white',
    backgroundColor: 'red',
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center'
  ),
  'card':Styles(
    height: 200,
    width: '100%',
    marginTop: 50,
    flexDirection: 'column',
    alignItems: 'flex-start',
    justifyContent: 'space-between',
    paddingBottom: 50,
    paddingTop: 50,
    paddingLeft: 50,
    borderRadius: 10,
    backgroundColor: 'white',
    boxShadow: [
      BoxShadow(
        offset: Offset(0,2),
        blurRadius:2,
        color: Colors.grey
      )
    ]
  ),
  'list':Styles(
    flexDirection: 'column',
    overflow: 'scroll',
    marginTop: 20
  ),
  'listItem':Styles(
    flexDirection: 'row',
    height: 100,
    marginTop: 20,
  ),
  'process':Styles(
    width: 200,
    height: 30,
    backgroundColor: 'white',
    flexDirection: 'column',
    justifyContent: 'center',
    alignItems: 'center',
    borderRadius: 15,
    borderStyle: 'solid',
    borderWidth: 2,
    borderColor: '#e5e5e5',
    // boxShadow: [
    //   BoxShadow(
    //     offset: Offset(0,1)
    //   )
    // ]
  ),
  'firend':Styles(
    flexDirection: 'row',
    alignItems: 'center',
    marginTop: 20
  ),
  'firendLogo':Styles(
    flexDirection: 'column',
    alignItems: 'center',
    marginRight: 30
  ),
  'firendSelectLogo':Styles(
    flexDirection: 'column',
    alignItems: 'center',
    marginRight: 30,
    borderRadius: 30,

  )
};