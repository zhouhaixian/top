import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:top/common/components/topic_card.dart';
import 'package:top/common/page_state.dart';
import 'package:http/http.dart' as http;
import 'package:top/user_agents.dart';

class WeiboPage extends StatefulWidget {
  const WeiboPage({super.key});

  @override
  WeiboPageState createState() => WeiboPageState();
}

class WeiboPageState extends PageState<WeiboPage> {
  WeiboPageState() : super(onlyListView: true);

  @override
  Future<List<TopicCard>> fetchCards() async {
    transform(MapEntry entry) {
      final index = entry.key + 1;
      final title = entry.value.text;
      final url = Uri.https('s.weibo.com', '/weibo', {'q': title});
      return TopicCard(index, title, url.toString());
    }

    final url =
        Uri.https('s.weibo.com', '/top/summary', {'cate': 'socialevent'});
    final response = await http.get(url, headers: {
      'Cookie':
          'SUB=_2AkMV3H0if8NxqwJRmPAWz2nqZYR2yArEieKjgIz5JRMxHRl-yT8XqnUvtRB6PlxTzRC8X2TyMCF7Q7Z35W3RuRHtA_SZ; SUBP=0033WrSXqPxfM72-Ws9jqgMF55529P9D9WF7U-x.8qqTTTbE-aYUsGiD',
      'User-Agent': UserAgents.windowsChrome.value
    });
    final document = parse(response.body);
    final topics = document
        .querySelectorAll('#pl_top_realtimehot table tbody .td-02 a')
        .asMap()
        .entries
        .map(transform);

    return topics.toList();
  }
}
