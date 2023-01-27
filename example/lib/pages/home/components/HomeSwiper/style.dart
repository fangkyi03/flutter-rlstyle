import 'package:flutter/material.dart';
import 'package:rlstyles/Tailwind/index.dart';

swiper() {
  return [
    FL_AlignCenter,
    FL_JustifyCenter,
    FL_WFull,
  ];
}

swiperContainer() {
  return [
    FL_Width(size: 350),
    FL_Height(size: 140),
    FL_FLEX_NO,
    FL_Clip_Radius(state: true),
    FL_Radius(size: 10),
    FL_MarginTop(size: 10)
  ];
}

swiperImage() {
  return [
    FL_Width(size: 350),
    FL_Height(size: 140),
    FL_BgSize(size: BoxFit.fill)
  ];
}
