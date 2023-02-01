import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rlstyles/main.dart';

class TextInputView extends HookWidget {
  final bool? autofocus;
  final Function()? onFocus;
  final Function()? onBlur;
  // 最大字数
  final int? maxlength;
  // 键盘类型
  final TextInputType? keyboardType;
  const TextInputView(
      {Key? key,
      this.autofocus = false,
      this.onFocus,
      this.onBlur,
      this.maxlength = -1,
      this.keyboardType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    // useEffect(() {
    //   focusNode.addListener(() {
    //     if (focusNode.hasFocus) {
    //       onFocus?.call();
    //     } else {
    //       onBlur?.call();
    //     }
    //   });
    //   return () {
    //     focusNode.dispose();
    //   };
    // }, [autofocus]);
    return TextField(
      decoration: null,
      // decoration:
      // InputDecoration(fillColor: Colors.blue.shade100, labelText: 'Hello'),
      focusNode: focusNode,
      cursorColor: Colors.black,
      maxLength: maxlength,
      keyboardType: keyboardType,
      autofocus: autofocus ?? false,
      style: TextStyle(color: Colors.black),
    );
  }
}
