import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:top/common/components/topic_card.dart';
import 'package:top/common/page_state.dart';
import 'package:http/http.dart' as http;
import 'package:top/models/douyin_model.dart';
import 'package:top/user_agents.dart';

class DouyinPage extends StatefulWidget {
  const DouyinPage({super.key});

  @override
  DouyinPageState createState() => DouyinPageState();
}

class DouyinPageState extends PageState<DouyinPage> {
  DouyinPageState() : super(onlyListView: true);

  @override
  Future<List<TopicCard>> fetchCards() async {
    transform(MapEntry entry) {
      Word topic = entry.value;
      final index = entry.key + 1;
      final title = topic.word!;
      final link = Uri.https('www.douyin.com', '/search/$title').toString();
      return TopicCard(index, title, link);
    }

    final url =
        Uri.https('www.iesdouyin.com', '/web/api/v2/hotsearch/billboard/word');
    final response = await http
        .get(url, headers: {'User-Agent': UserAgents.windowsChrome.value});
    final topics = DouyinModel.fromJson(jsonDecode(response.body)).wordList;

    return topics!.asMap().entries.map(transform).toList();
  }
}
