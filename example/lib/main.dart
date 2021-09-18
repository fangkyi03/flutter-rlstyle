import 'package:flutter/material.dart';
import 'package:rlstyles/Component/CssRule.dart';
import 'package:rlstyles/main.dart';

void main() {
  runApp(App());
}

class App extends HookWidget {
  const App({Key? key}) : super(key: key);

  Widget renderView() {
    return View(
      styles: {
        CssRule.backgroundColor: 'red',
        CssRule.width: '100%',
        CssRule.height: 500,
        CssRule.justifyContent: 'center',
        CssRule.alignItems: 'center',
      },
      children: [
        View(
          styles: {
            CssRule.alignItems: 'center',
            CssRule.backgroundColor: 'blue'
          },
          children: [
            TextView(
              '1232',
              styles: {CssRule.fontSize: 26},
            ),
            TextView(
              '1',
              styles: {
                CssRule.fontSize: 50,
              },
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter_ScreenUtil',
        home: Scaffold(body: SafeArea(child: renderView())),
      ),
    );
  }
}
