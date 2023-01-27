import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

main() {
  return [
    FL_FlexColumn,
    FL_JustifyBetween,
    FL_AlignCenter,
    FL_Margin(size: 10),
    FL_BgColor(color: Colors.white),
    FL_Width(size: 355),
    FL_Radius(size: 10),
  ];
}

imageGroup() {
  return [
    FL_OverScrollX,
    FL_FlexRow,
    FL_Height(size: 80),
    FL_Width(size: 350),
    // FL_ScrollBar(state: false),
    FL_Margin(size: 10),
    FL_MarginBottom(size: 0)
  ];
}

image() {
  return [
    FL_FlexColumn,
    FL_AlignCenter,
    FL_JustifyCenter,
    FL_MarginRight(size: 5)
  ];
}

text() {
  return [
    FL_FlexRow,
    FL_AlignCenter,
    FL_Font_Color(color: '#f2270c'),
    FL_Font_Size(size: 12)
  ];
}

scrollImage() {
  return [FL_Height(size: 55), FL_Width(size: 55), FL_BgSizeCover];
}

header() {
  return [
    FL_FlexRow,
    FL_AlignCenter,
    FL_JustifyBetween,
    FL_Width(size: 355),
    FL_Height(size: 33),
  ];
}

headerBkImage() {
  return [FL_Width(size: 355), FL_Height(size: 30), FL_BgSizeFill, FL_Absolute];
}

headerView() {
  return [
    FL_Absolute,
    FL_FlexRow,
    FL_AlignCenter,
    FL_JustifyBetween,
    FL_Width(size: 345)
  ];
}

killText() {
  return [
    FL_Height(
      size: 29,
    ),
    FL_MarginLeft(size: 12),
    FL_MarginRight(size: 5),
    FL_MarginTop(size: 4),
    FL_FWeight(size: 'bold'),
    FL_Font_Size(size: 14),
  ];
}
