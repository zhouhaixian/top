class FSearchModel {
  List<Topic>? topics;

  FSearchModel({this.topics});

  FSearchModel.fromJson(Map<String, dynamic> json) {
    if (json["topics"] is List) {
      topics = json["topics"] == null
          ? null
          : (json["topics"] as List).map((e) => Topic.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> raw = <String, dynamic>{};
    if (topics != null) {
      raw["topics"] = topics?.map((e) => e.toJson()).toList();
    }
    return raw;
  }
}

class Topic {
  String? title;
  String? link;

  Topic({this.title, this.link});

  Topic.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["link"] is String) {
      link = json["link"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> raw = <String, dynamic>{};
    raw["title"] = title;
    raw["link"] = link;
    return raw;
  }
}
