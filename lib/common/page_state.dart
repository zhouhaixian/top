import 'package:flutter/material.dart';
import 'package:top/common/components/topic_card.dart';

abstract class PageState<T extends StatefulWidget> extends State<T> {
  Future<List<TopicCard>> fetchCards();
  bool onlyListView = false;

  PageState({required this.onlyListView});

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchCards(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          getInnerWidget() {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                return LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth < 520 || onlyListView) {
                    return ListView(
                      padding: const EdgeInsets.all(10),
                      children: snapshot.data,
                    );
                  } else {
                    return GridView.count(
                      crossAxisCount: constraints.maxWidth ~/ 260,
                      padding: const EdgeInsets.all(10),
                      childAspectRatio: 0.92,
                      children: snapshot.data,
                    );
                  }
                });
            }
          }

          return Scaffold(
            body: getInnerWidget(),
            floatingActionButton: FloatingActionButton(
                onPressed: refresh,
                tooltip: '刷新',
                child: const Icon(Icons.refresh)),
          );
        });
  }
}
