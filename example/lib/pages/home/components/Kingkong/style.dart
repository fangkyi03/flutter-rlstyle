// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

main() {
  return [
    FL_FLEX_NO,
    FL_WFull,
    FL_Height(size: 160),
  ];
}

group() {
  return [
    FL_FlexWrap,
  ];
}

icon(dynamic color) {
  return [
    FL_Width(size: 75),
    FL_Height(size: 74),
    FL_FlexColumn,
    FL_AlignCenter,
    FL_JustifyCenter,
    FL_Font_Color(color: 'rgb(102,102,102)'),
    FL_Font_Size(size: 12)
    // FL_BgColor(color: color)
  ];
}

List<Map<String, dynamic>> img() {
  return [FL_Width(size: 40), FL_Height(size: 40), FL_BgSizeCover];
}
