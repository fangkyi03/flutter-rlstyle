import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

class CountDown extends HookWidget {
  const CountDown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 格式化时间
    Map<String, dynamic> formatTime(int s) {
      int hour = (s ~/ 3600) % 24;
      int minute = s % 3600 ~/ 60;
      int second = s % 60;
      return {'hour': hour, 'minute': minute, 'second': second};
    }

    final countTime = useState(30 * 60);
    final countDownTime = useState(formatTime(countTime.value));
    final countDownText = useState('00:00:00');
    useEffect(() {
      var timeId;
      setInterval((periodicTime) {
        countTime.value -= 1;
        countDownTime.value = formatTime(countTime.value);
        final time = countDownTime.value;
        countDownText.value = time['hour'].toString() +
            ':' +
            time['minute'].toString() +
            ':' +
            time['second'].toString();
        timeId = periodicTime;
      }, 1000);
      return () {
        timeId.cancel();
      };
    }, [countDownTime, countTime, countDownText]);

    Widget renderTime(String time, int index) {
      return View(
        styles: [
          FL_FlexRow,
          FL_AlignCenter,
        ],
        children: [
          TextView(
            time.length < 2 ? '0' + time : time,
            styles: [
              FL_Font_Size(size: 14),
              FL_BgColor(color: '#fa2c19'),
              FL_Font_Color(color: 'white'),
              FL_Radius(size: 4),
              FL_Height(size: 17)
            ],
          ),
          index < 2
              ? TextView(
                  ':',
                  styles: [
                    FL_Width(size: 10),
                    FL_AlignCenter,
                    FL_JustifyCenter,
                    FL_FWeight(size: 'bold'),
                    FL_Font_Color(color: '#fa2c19')
                  ],
                )
              : Container()
        ],
      );
    }

    Widget renderTimeGroup(String time) {
      final split = time.split(':');
      return View(
        styles: [FL_FlexRow, FL_AlignCenter],
        children:
            split.asMap().keys.map((i) => renderTime(split[i], i)).toList(),
      );
    }

    return View(
      children: [renderTimeGroup(countDownText.value)],
    );
  }
}
