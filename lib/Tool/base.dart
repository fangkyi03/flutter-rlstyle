
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

typedef periodicCallBack = void Function( Timer periodicTime);

void setTimeout (callback,time) {
  Duration timeDelay = Duration(milliseconds: time);
  Timer(timeDelay,callback);
}

void setInterval (periodicCallBack,time) {
  Duration periodic = Duration(milliseconds: time);
  Timer.periodic(periodic, (intervalTime){
    periodicCallBack(intervalTime);
  });
}

void alert(BuildContext context,String title) {
  showDialog(
    context:context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
      );
    }
  );
}

String getTypeOf(dynamic data) {
  String type = data.runtimeType.toString();
  if (type == 'String') {
    return (data as String).indexOf('%') != -1 ? '%' : 'String';
  }else {
    return type;
  }
}

double getSize ({dynamic size,double defValue = 0.0}) {
  if (size == null) return defValue;
  final type = getTypeOf(size);
  double mSize;
  switch (type) {
    case 'String':
      mSize = double.parse((size as String).replaceAll('px',''));
      break;
    case 'int':
      mSize = (size as int).toDouble();
      break;
    case 'double':
      mSize = (size as double);
  }
  if (mSize != null ) {
    return ScreenUtil.getInstance().setWidth(mSize);
  } else {
    return defValue;
  }
}