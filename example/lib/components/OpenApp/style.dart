import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

main() {
  return [
    FL_AlignCenter,
    FL_JustifyCenter
    // FL_Absolute,
    // FL_AbsLeft(size: 10),
    // FL_AbsRight(size: 10),
    // FL_AbsBottom(size: 10),
    // FL_Width(size: 110),
    // FL_Height(size: 40),
  ];
}

swiper() {
  return [
    FL_Absolute,
    FL_Height(size: 40),
    FL_Width(size: 100),
    FL_FLEX_NO,
    FL_AbsRight(size: 0),
    FL_AbsTop(size: 10),
    FL_Font_Color(color: Colors.white)
  ];
}
