import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';
import './style.dart' as style;

class KingKong extends HookWidget {
  final data;
  const KingKong({Key? key, this.data = const []}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget renderIcon(Map item) {
      return View(
        styles: style.icon(item['color']),
        children: [
          ImageView(
            styles: style.img(),
            url: item["img"] ?? '',
          ),
          TextView(item['name'])
        ],
      );
    }

    return View(
        styles: style.group(),
        children: data.map((e) => renderIcon(e)).toList());
  }
}
