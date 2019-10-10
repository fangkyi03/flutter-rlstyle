
import 'dart:async';

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