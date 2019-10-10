import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  if (mSize != null && mSize > 0) {
    return ScreenUtil.getInstance().setWidth(mSize);
  } else {
    return defValue;
  }
}