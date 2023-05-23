import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';

class TextInputView extends HookWidget {
  final bool? autofocus;
  final Function()? onFocus;
  final Function()? onBlur;
  // 最大字数
  final int? maxlength;
  // 键盘类型
  final TextInputType? keyboardType;
  final String? placeholder;
  const TextInputView(
      {Key? key,
      this.autofocus = false,
      this.onFocus,
      this.onBlur,
      this.maxlength = -1,
      this.keyboardType,
      this.placeholder = ''})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    final inputValue = useState('');
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
    renderInput() {
      return CupertinoSearchTextField(
        // controller: textController,
        // keyboardType: TextInputType.phone,
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        suffixIcon: Icon(
          Icons.search,
          color: Colors.white.withOpacity(0.0),
        ),
        prefixIcon: Container(),
        // suffixIcon: const Icon(Icons.track_changes),
        backgroundColor: Colors.transparent,
        placeholder: placeholder,
      );
    }

    renderPlaceholder() {
      return Frame(
        children: [TextView(placeholder!)],
      );
    }

    return renderInput();
    // return renderPlaceholder();
  }
}
