import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

getMain() {
  return [
    FL_HFull,
    FL_WFull,
    FL_FlexColumn,
    FL_BgColor(color: 'rgb(245,245,245)'),
    FL_OverScrollY,
    FL_ScrollBar(state: false)
  ];
}

getHeader() {
  return [
    FL_FlexRow,
    FL_AlignCenter,
    FL_JustifyBetween,
    FL_WFull,
    FL_Height(size: 44),
    FL_BgColor(color: Colors.red),
    FL_PaddingLeft(size: 10),
    FL_PaddingRight(size: 10),
  ];
}

getSearch() {
  return [
    FL_BgColor(color: Colors.white),
    FL_Width(size: 273),
    FL_Height(size: 30),
    FL_FlexRow,
    FL_AlignCenter,
    FL_Radius(size: 15),
    FL_PaddingLeft(size: 15)
  ];
}

fixHeader() {
  return [
    // FL_Absolute,
    // FL_Height(size: 60),
    // FL_AbsBottom(size: 300),
    // FL_BackgroundColor(color: Colors.red)
  ];
}

openApp() {
  return [
    FL_Absolute,
    FL_AbsLeft(size: 0),
    FL_AbsRight(size: 0),
    FL_AbsBottom(size: 40),
    FL_JustifyCenter,
    FL_AlignCenter,
  ];
}
