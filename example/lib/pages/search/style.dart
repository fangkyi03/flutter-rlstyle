import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

main() {
  return [FL_WFull, FL_HFull, FL_BackgroundColor(color: 'rgb(245,245,245)')];
}

abs() {
  return [
    FL_Absolute,
    FL_Height(size: 60),
    FL_BackgroundColor(color: Colors.red)
  ];
}

header() {
  return [
    FL_Height(size: 45),
    FL_WFull,
    FL_AlignCenter,
    FL_JustifyBetween,
    FL_FlexRow,
    FL_PaddingRight(size: 10),
    FL_BackgroundColor(color: 'white'),
    FL_BorderBottom(
      color: Colors.grey,
    )
  ];
}

search() {
  return [
    FL_Width(size: 273),
    FL_Height(size: 30),
    FL_BackgroundColor(color: '#f7f7f7'),
    FL_BorderRadius(size: 15),
    FL_ItemCenter,
    FL_FlexRow,
    FL_PaddingLeft(size: 10)
  ];
}

icons() {
  return [
    FL_Width(size: 40),
    FL_Height(size: 44),
    FL_JustifyCenter,
    FL_AlignCenter
  ];
}

searchButton() {
  return [
    FL_Width(size: 40),
    FL_Height(size: 28),
    FL_AlignCenter,
    FL_JustifyCenter,
    FL_Font_Color(color: Colors.white),
    FL_BackgroundColor(color: '#e93b3d'),
    FL_BorderRadius(size: 5),
    FL_Font_Size(size: 14)
  ];
}
