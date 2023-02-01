import 'package:rlstyles/main.dart';

main() {
  return [
    // FL_Height(size: 40)
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
    FL_AlignEnd,
    FL_JustifyCenter,
    FL_Width(size: 100),
    FL_AbsRight(size: 0),
    FL_AbsLeft(size: 90),
    FL_AbsRight(size: 20),
    FL_AbsBottom(size: 0)
  ];
}

swiperView() {
  return [
    FL_NO_FLEX,
    FL_Height(size: 20),
  ];
}
