typedef OnClick = void Function();

class ButtonItem {
  final String name;
  final OnClick? onClick;
  final Map<String, dynamic> style;
  ButtonItem({required this.name, this.onClick, this.style = const {}});
}
