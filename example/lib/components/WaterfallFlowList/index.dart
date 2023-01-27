import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

typedef RenderCallBack = Widget Function(Map item, int index);

class WaterfallFlowList extends HookWidget {
  final List data;
  final col;
  final RenderCallBack renderItem;
  const WaterfallFlowList(
      {Key? key, required this.data, this.col = 2, required this.renderItem})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return View(
      children: data.map((e) => TextView('child')).toList(),
    );
  }
}
