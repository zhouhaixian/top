class DouyinModel {
  int? statusCode;
  String? activeTime;
  List<Word>? wordList;
  Extra? extra;

  DouyinModel({this.statusCode, this.activeTime, this.wordList, this.extra});

  DouyinModel.fromJson(Map<String, dynamic> json) {
    if (json["status_code"] is int) {
      statusCode = json["status_code"];
    }
    if (json["active_time"] is String) {
      activeTime = json["active_time"];
    }
    if (json["word_list"] is List) {
      wordList = json["word_list"] == null
          ? null
          : (json["word_list"] as List).map((e) => Word.fromJson(e)).toList();
    }
    if (json["extra"] is Map) {
      extra = json["extra"] == null ? null : Extra.fromJson(json["extra"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> raw = <String, dynamic>{};
    raw["status_code"] = statusCode;
    raw["active_time"] = activeTime;
    if (wordList != null) {
      raw["word_list"] = wordList?.map((e) => e.toJson()).toList();
    }
    if (extra != null) {
      raw["extra"] = extra?.toJson();
    }
    return raw;
  }
}

class Extra {
  int? now;
  String? logid;

  Extra({this.now, this.logid});

  Extra.fromJson(Map<String, dynamic> json) {
    if (json["now"] is int) {
      now = json["now"];
    }
    if (json["logid"] is String) {
      logid = json["logid"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> raw = <String, dynamic>{};
    raw["now"] = now;
    raw["logid"] = logid;
    return raw;
  }
}

class Word {
  String? word;
  int? hotValue;
  int? label;

  Word({this.word, this.hotValue, this.label});

  Word.fromJson(Map<String, dynamic> json) {
    if (json["word"] is String) {
      word = json["word"];
    }
    if (json["hot_value"] is int) {
      hotValue = json["hot_value"];
    }
    if (json["label"] is int) {
      label = json["label"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> raw = <String, dynamic>{};
    raw["word"] = word;
    raw["hot_value"] = hotValue;
    raw["label"] = label;
    return raw;
  }
}
