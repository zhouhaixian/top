import 'package:flutter/material.dart';
import 'package:top/constants.dart';
import 'package:top/pages/baidu_page.dart';
import 'package:top/pages/douyin_page.dart';
import 'package:top/pages/fsearch_page.dart';
import 'package:top/pages/weibo_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(Constant.appName),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "百度",
                ),
                Tab(
                  text: "微博",
                ),
                Tab(
                  text: "抖音",
                ),
                Tab(
                  text: "FSearch",
                )
              ],
            ),
          ),
          body: const TabBarView(children: [
            BaiduPage(),
            WeiboPage(),
            DouyinPage(),
            FSearchPage()
          ]),
        ),
      ),
    );
  }
}
