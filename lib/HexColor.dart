import 'package:flutter/material.dart';
import './Tool.dart';
class HexColor extends Color{

  static int _getColorFromHex(dynamic hexColor) {
    final type = getTypeOf(hexColor);
    if (type.indexOf('Color') != -1) {
      return (hexColor as Color).value;
    }
    if (hexColor != null && hexColor.indexOf('rgba') != -1) {
      return getRGBA(hexColor);
    }else if (hexColor != null && hexColor.indexOf('rgb') != -1) {
      return getRGB(hexColor);
    }else if (hexColor != null && hexColor.indexOf('#') != -1) {
      hexColor = hexColor.toUpperCase().replaceAll("#", "");
      hexColor = hexColor.replaceAll('0X', '');
      if (hexColor.length == 6) {
        hexColor = "FF" + hexColor;
      }
      return int.parse(hexColor, radix: 16);
    }else if (hexColor != null ){
      Map<String,Color> colorObj = {
        'black':Colors.black,
        'red':Colors.red,
        'white':Colors.white,
        'blue':Colors.blue,
        'yellow':Colors.yellow,
        'green':Colors.green
      };
      return colorObj[hexColor] != null ? colorObj[hexColor].value : 0;
    }else {
      return 0;
    }
  }

  static LinearGradient getLineGradient (String color) {
    final String str = color.replaceAll('linear-gradient(','');
    final String splitText = str.substring(0,str.length - 1);
    final List<String> strList = splitText.split(RegExp(r',(?![^()]*\))'));
    List<String> colorArr ;
    List<String> direction = [];
    if (
      strList[0].indexOf('top') != -1 || strList[0].indexOf('left') != -1 || 
      strList[0].indexOf('right') != -1 || strList[0].indexOf('bottom') != -1 
    ) {
      colorArr = strList.sublist(1);
    }else {
      colorArr = strList;
    }
    return LinearGradient(colors:colorArr.map((e)=>HexColor(e)).toList());
  }

  static int getRGB(String c) {
    String str = c.replaceAll('rgb(','').replaceAll(')', '');
    List<String> split = str.split(',');
    double r = double.parse(split[0]);
    double g = double.parse(split[1]);
    double b = double.parse(split[2]);
    return getArgb(1.0,r.toInt(),g.toInt(),b.toInt());
  }

  static int getRGBA(String c){
    String str = c.replaceAll('rgba(','').replaceAll(')', '');
    List<String> split = str.split(',');
    double r = double.parse(split[0]);
    double g = double.parse(split[1]);
    double b = double.parse(split[2]);
    double a = double.parse(split[3]);
    return getArgb(a,r.toInt(),g.toInt(),b.toInt());
  }

  static int getArgb(double a,int r ,int g ,int b) {
    return Color.fromRGBO(r, g, b,a).value;
  }

  HexColor(final dynamic hexColor) : super(_getColorFromHex(hexColor));
}