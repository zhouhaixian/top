import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:top/common/components/topic_card.dart';
import 'package:top/common/page_state.dart';
import 'package:http/http.dart' as http;
import 'package:top/models/fsearch_model.dart';
import 'package:top/user_agents.dart';

class FSearchPage extends StatefulWidget {
  const FSearchPage({super.key});

  @override
  FSearchPageState createState() => FSearchPageState();
}

class FSearchPageState extends PageState<FSearchPage> {
  FSearchPageState() : super(onlyListView: true);

  @override
  Future<List<TopicCard>> fetchCards() async {
    transform(MapEntry entry) {
      int index = entry.key + 1;
      Topic topic = entry.value;
      return TopicCard(index, topic.title!, topic.link!);
    }

    final url =
        Uri.https('fsoufsou.com', '/search-engine-listing/v1/trending/topics');
    final response = await http
        .get(url, headers: {'User-Agent': UserAgents.windowsChrome.value});
    final topics = FSearchModel.fromJson(jsonDecode(response.body)).topics;

    return topics!.asMap().entries.map(transform).toList();
  }
}
