import 'package:example/component/Button/item.dart';
import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';
import '../Button/index.dart';

typedef OnChange = void Function(int index);

class ButtonGroup extends HookWidget {
  final List<ButtonItem> data;
  final OnChange? onChange;
  final Map<String, dynamic> style;
  const ButtonGroup(
      {Key? key, this.data = const [], this.onChange, this.style = const {}})
      : super(key: key);

  getStyle() {
    return {
      'main': {
        CssRule.flexDirection: 'row',
        CssRule.alignItems: 'center',
        CssRule.flexWrap: 'wrap',
        ...style
      },
    };
  }

  @override
  Widget build(BuildContext context) {
    final active = useState(0);

    Widget renderItem(index) {
      final item = data[index];
      final isFocus = index == active.value;
      return Button(
        item.name,
        type: 'primary',
        ghost: !isFocus,
        style: item.style,
        onClick: () {
          active.value = index;
          onChange!(index);
          item.onClick!();
        },
      );
    }

    return View(
        styles: getStyle()['main'],
        children: data.asMap().keys.map((index) => renderItem(index)).toList());
  }
}
