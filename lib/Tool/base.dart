import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

typedef PeriodicCallBack = void Function(Timer periodicTime);

enum StyleType { array, map, nul }

void setTimeout(callback, time) {
  Duration timeDelay = Duration(milliseconds: time);
  Timer(timeDelay, callback);
}

void setInterval(PeriodicCallBack click, time) {
  Duration periodic = Duration(milliseconds: time);
  Timer.periodic(periodic, (intervalTime) {
    click(intervalTime);
  });
}

void alert(BuildContext context, String title) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
        );
      });
}

String getTypeOf(dynamic data) {
  if (data != null) {
    String type = data.runtimeType.toString();
    if (type == 'String') {
      return (data as String).indexOf('%') != -1 ? '%' : 'String';
    } else {
      return type;
    }
  } else {
    return 'String';
  }
}

getSize({dynamic size, dynamic defValue = 0.0, isTransform = true}) {
  if (size == null) return defValue;
  final type = getTypeOf(size);
  double? mSize;
  switch (type) {
    case 'String':
      mSize = double.parse((size as String).replaceAll('px', ''));
      break;
    case 'int':
      mSize = (size as int).toDouble();
      break;
    case 'double':
      mSize = (size as double);
  }
  if (mSize != null) {
    if (isTransform) {
      return ScreenUtil().setWidth(mSize);
    } else {
      return mSize;
    }
  } else {
    return defValue;
  }
}

StyleType getStyleType(dynamic style) {
  if (style is List) {
    return StyleType.array;
  } else if (style is Map) {
    return StyleType.map;
  } else {
    return StyleType.nul;
  }
}

getStyle(dynamic style) {
  switch (getStyleType(style)) {
    case StyleType.array:
      return mergeStyle(style);
    case StyleType.map:
      return style;
    case StyleType.nul:
      return {};
  }
}
