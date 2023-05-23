import 'package:example/components/Main/index.dart';
import 'package:example/components/OpenApp/index.dart';
import 'package:flutter/material.dart';
import 'package:rlstyles/main.dart';
import './style.dart' as style;

class Search extends HookWidget {
  const Search({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    renderSearch() {
      return Frame(
        styles: style.search(),
        children: [
          Icon(Icons.search),
          Frame(
            styles: [FL_Width(size: 200), FL_MarginLeft(size: 5)],
            children: [
              TextInputView(
                placeholder: '请输入内容',
              )
            ],
          )
        ],
      );
    }

    renderSearchButton() {
      return Frame(
        styles: style.searchButton(),
        children: [TextView('搜索')],
      );
    }

    renderHeader() {
      return Frame(
        styles: style.header(),
        children: [
          Frame(
            styles: style.icons(),
            onClick: () {
              Navigator.pop(context);
            },
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

    renderMenu(String name, dynamic right) {
      return Frame(
        styles: [
          FL_ItemCenter,
          FL_JustifyBetween,
          FL_FlexRow,
          FL_Font_Size(size: 14),
          FL_WFull
        ],
        children: [
          TextView(name),
          Frame(
            children: [
              right is String ? TextView(right) : Container(),
              right is Widget ? right : Container()
            ],
          )
        ],
      );
    }

    renderTextButton(String text) {
      return Frame(
        styles: [
          FL_MarginTop(size: 5),
          FL_MarginRight(size: 10),
          FL_Height(size: 23),
          FL_Width(size: 80),
          FL_BorderRadius(size: 5),
          FL_BackgroundColor(color: '#f0f2f5'),
          FL_ItemCenter,
          FL_JustifyCenter,
          FL_Font_Color(color: '#686868')
        ],
        children: [TextView(text)],
      );
    }

    renderTextGroup(List<String> texts) {
      return Frame(
        styles: [
          FL_FlexWrap,
          FL_WFull,
        ],
        children: texts.map((e) => renderTextButton(e)).toList(),
      );
    }

    renderRecentSearch() {
      final data = List.generate(10, (int index) => '测试');
      return Frame(
        styles: [FL_MarginTop(size: 10)],
        children: [
          renderMenu(
              '最近搜索',
              Icon(
                Icons.delete_outline,
                color: Colors.grey,
              )),
          renderTextGroup(data)
        ],
      );
    }

    renderHotSearch() {
      final data = List.generate(10, (int index) => '测试');
      return Frame(
          styles: [FL_MarginTop(size: 10)],
          children: [renderMenu('最近搜索', '隐藏'), renderTextGroup(data)]);
    }

    renderBody() {
      return Frame(
        styles: [FL_Padding(size: 10), FL_BackgroundColor(color: 'white')],
        children: [renderRecentSearch(), renderHotSearch()],
      );
    }

    return MainView(
      child: Frame(
        styles: style.main(),
        children: [
          renderHeader(),
          renderBody(),
          Positioned(
            child: OpenApp(),
            bottom: 40,
            left: 0,
            right: 0,
          )
        ],
      ),
    );
  }
}
