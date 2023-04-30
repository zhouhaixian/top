import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:top/common/components/topic_card.dart';
import 'package:top/common/page_state.dart';
import 'package:http/http.dart' as http;
import 'package:top/models/baidu_model.dart';
import 'package:top/user_agents.dart';

class BaiduPage extends StatefulWidget {
  const BaiduPage({super.key});

  @override
  BaiduPageState createState() => BaiduPageState();
}

class BaiduPageState extends PageState<BaiduPage> {
  BaiduPageState() : super(onlyListView: false);

  @override
  Future<List<TopicCard>> fetchCards() async {
    transform(Content e) => TopicCard(
          e.index!,
          e.word!,
          e.url!.replaceFirst('m', 'www'),
          cover: e.img,
          description: e.desc,
        );

    final url = Uri.https(
        'top.baidu.com', '/api/board', {'platform': 'wise', 'tab': 'realtime'});
    final response = await http
        .get(url, headers: {'User-Agent': UserAgents.windowsChrome.value});
    final data = BaiduModel.fromJson(jsonDecode(response.body)).data;
    final topCards = data!.cards![0].topContent!.map(transform);
    final commonCards = data.cards![0].content!.map(transform);

    return [...topCards, ...commonCards];
  }
}
