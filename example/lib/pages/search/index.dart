import 'package:example/components/OpenApp/index.dart';
import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';
import './style.dart' as style;

class Search extends HookWidget {
  const Search({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    renderSearch() {
      return View(
        styles: style.search(),
        children: [
          Icon(Icons.search),
          View(
            styles: [FL_Width(size: 200), FL_MarginLeft(size: 5)],
            children: [TextInputView()],
          )
        ],
      );
    }

    renderSearchButton() {
      return View(
        styles: style.searchButton(),
        children: [TextView('搜索')],
      );
    }

    renderHeader() {
      return View(
        styles: style.header(),
        children: [
          View(
            styles: style.icons(),
            children: [
              Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
            ],
          ),
          renderSearch(),
          renderSearchButton()
        ],
      );
    }

    return View(
      styles: style.main(),
      children: [
        renderHeader(),
        Positioned(
          child: OpenApp(),
          bottom: 40,
          left: 0,
          right: 0,
        )
      ],
    );
  }
}
