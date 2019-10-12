import 'package:flutter/material.dart';
import 'package:rlStyles/main.dart';

class Demo6 extends StatefulWidget {
  Demo6({Key key,this.navigation}) : super(key: key);
  final NavigationOption navigation;
  _Demo6State createState() => _Demo6State();
} 

class _Demo6State extends State<Demo6>  with SingleTickerProviderStateMixin {

  Animation hello,input,button;
  AnimationController animationController;

  double width;
  @override
  void initState() { 
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 2));
    hello = Tween<double>(begin: -1.0,end: 0.0).animate(animationController);
    input = Tween<double>(begin: -1.0,end: 0.0).animate(
      CurvedAnimation(
        curve: Interval(0.5,0.8),
        parent: animationController
      )
    );
    button = Tween<double>(begin: -1.0,end: 0.0).animate(
      CurvedAnimation(
        curve: Interval(0.8,1.0),
        parent: animationController
      )
    );
  }

  renderLogoInfo () {
    return Transform(
      transform: Matrix4.translationValues(hello.value * width, 0.0, 0.0),
      child: TextView(
        'Hello There',
        styles: styles['logoTitle'],
      )
    );
  }

  Widget renderInput (Map<String,dynamic> item) {
    return TextField(
      decoration: InputDecoration(
        labelText: item['name']
      )
    );
  }

  renderInputGroup () {
    List<Map<String,dynamic>> data = [
      {
        'name':'EMALL',
        'label':'请输入邮箱'
      },
      {
        'name':'PASSWORD',
        'label':'请输入密码'
      }
    ];
    return Transform(
      transform: Matrix4.translationValues(input.value * width, 0.0,0.0),
      child: View(
        styles: styles['inputGroup'],
        children: [
          ...data.map((e)=>renderInput(e)).toList(),
          renderForgotPassword()
        ],
      ),
    );
  }

  renderForgotPassword () {
    return TextView(
      'Forgot Password',
      styles:Styles(
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'flex-end',
        marginTop: 10,
        color: Colors.green,
        fontSize: 30,
        fontWeight: 'bold'
      )
    );
  }

  Widget renderButton (Map<String,dynamic> item) {
    return TextView(
      item['name'],
      styles:Styles(
        width: '100%',
        height: 100,
        borderRadius: 50,
        color: item['textColor'],
        backgroundColor: item['bkColor'],
        flexDirection: 'column',
        alignItems: 'center',
        justifyContent: 'center',
        borderWidth: 2,
        borderStyle: 'solid',
        borderColor: item['borderColor'],
        marginTop: 50,
        fontSize: 30
      )
    );
  }

  renderButtonGroup () {
    List<Map<String,dynamic>> data = [
      {
        'name':'Login',
        'bkColor':'green',
        'textColor':'white'
      },
      {
        'name':'Login in with Facebook',
        'bkColor':'white',
        'textColor':'black',
        'borderColor':'black',
      }
    ];
    return Transform(
      transform: Matrix4.translationValues(button.value * width, 0.0, 0.0),
      child: View(
        styles: styles['buttonGroup'],
        children:[
          ... data.map((e)=>renderButton(e)).toList(),
          renderFoot()
        ]
      ),
    );
  }

  renderFoot () {
    return View(
      styles: Styles(flexDirection: 'row',alignItems: 'center',justifyContent: 'center',marginTop: 30),
      children: <Widget>[
        TextView('New to Spotify?',styles: Styles(color: 'black',fontSize: 30),),
        TextView('Register',styles: Styles(color: 'green',fontSize: 30),)
      ],
    );
  }

  @override 
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context,Widget child){
        return  View(
        styles: styles['main'],
        children: <Widget>[
          renderLogoInfo(),
          renderInputGroup(),
          renderButtonGroup(),
        ]
        );
      },
    );
  }
}

const Map<String,Styles> styles = {
  'main':Styles(
    width: double.infinity,
    height: double.infinity,
    padding: 20,
    flexDirection: 'column',
    overflow: 'scroll',
  ),
  'logoTitle':Styles(
    width: 400,
    fontSize: 150,
    fontWeight: 'bold'
  ),
  'inputGroup':Styles(
    flexDirection: 'column',
  ),
  'buttonGroup':Styles(
    flexDirection: 'column'
  )
};