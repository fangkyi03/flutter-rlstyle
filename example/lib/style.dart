import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

getMain() {
  return [FL_HFull, FL_WFull, FL_FlexColumn, FL_BgColor(color: Colors.white)];
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
    FL_PaddingRight(size: 10)
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

getSwiper() {
  return [
    FL_AlignCenter,
    FL_JustifyCenter,
    FL_WFull,
  ];
}

getSwiperContainer() {
  return [
    FL_Width(size: 330),
    FL_Height(size: 140),
    FL_FLEX_NO,
    FL_Clip_Radius(state: true),
    FL_Radius(size: 10),
    FL_MarginTop(size: 10)
  ];
}

getSwiperImage() {
  return [
    FL_Width(size: 350),
    FL_Height(size: 140),
    FL_BgSize(size: BoxFit.fill)
  ];
}
