class BaiduModel {
  bool? success;
  Data? data;
  Error? error;

  BaiduModel({this.success, this.data, this.error});

  BaiduModel.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) {
      success = json["success"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
    if (json["error"] is Map) {
      error = json["error"] == null ? null : Error.fromJson(json["error"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> raw = <String, dynamic>{};
    raw["success"] = success;
    if (data != null) {
      raw["data"] = data?.toJson();
    }
    if (error != null) {
      raw["error"] = error?.toJson();
    }
    return raw;
  }
}

class Error {
  int? code;
  String? message;

  Error({this.code, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    if (json["code"] is int) {
      code = json["code"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> raw = <String, dynamic>{};
    raw["code"] = code;
    raw["message"] = message;
    return raw;
  }
}

class Data {
  List<Cards>? cards;
  String? curBoardName;
  String? logid;
  String? platform;
  List<TabBoard>? tabBoard;
  List<dynamic>? tag;
  UserInfo? userInfo;

  Data(
      {this.cards,
      this.curBoardName,
      this.logid,
      this.platform,
      this.tabBoard,
      this.tag,
      this.userInfo});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["cards"] is List) {
      cards = json["cards"] == null
          ? null
          : (json["cards"] as List).map((e) => Cards.fromJson(e)).toList();
    }
    if (json["curBoardName"] is String) {
      curBoardName = json["curBoardName"];
    }
    if (json["logid"] is String) {
      logid = json["logid"];
    }
    if (json["platform"] is String) {
      platform = json["platform"];
    }
    if (json["tabBoard"] is List) {
      tabBoard = json["tabBoard"] == null
          ? null
          : (json["tabBoard"] as List)
              .map((e) => TabBoard.fromJson(e))
              .toList();
    }
    if (json["tag"] is List) {
      tag = json["tag"] ?? [];
    }
    if (json["userInfo"] is Map) {
      userInfo =
          json["userInfo"] == null ? null : UserInfo.fromJson(json["userInfo"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> raw = <String, dynamic>{};
    if (cards != null) {
      raw["cards"] = cards?.map((e) => e.toJson()).toList();
    }
    raw["curBoardName"] = curBoardName;
    raw["logid"] = logid;
    raw["platform"] = platform;
    if (tabBoard != null) {
      raw["tabBoard"] = tabBoard?.map((e) => e.toJson()).toList();
    }
    if (tag != null) {
      raw["tag"] = tag;
    }
    if (userInfo != null) {
      raw["userInfo"] = userInfo?.toJson();
    }
    return raw;
  }
}

class UserInfo {
  int? isLogin;

  UserInfo({this.isLogin});

  UserInfo.fromJson(Map<String, dynamic> json) {
    if (json["isLogin"] is int) {
      isLogin = json["isLogin"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> raw = <String, dynamic>{};
    raw["isLogin"] = isLogin;
    return raw;
  }
}

class TabBoard {
  int? index;
  String? text;
  String? typeName;

  TabBoard({this.index, this.text, this.typeName});

  TabBoard.fromJson(Map<String, dynamic> json) {
    if (json["index"] is int) {
      index = json["index"];
    }
    if (json["text"] is String) {
      text = json["text"];
    }
    if (json["typeName"] is String) {
      typeName = json["typeName"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> raw = <String, dynamic>{};
    raw["index"] = index;
    raw["text"] = text;
    raw["typeName"] = typeName;
    return raw;
  }
}

class Cards {
  String? component;
  List<Content>? content;
  int? more;
  String? moreAppUrl;
  String? moreUrl;
  String? text;
  List<Content>? topContent;
  String? typeName;
  String? updateTime;

  Cards(
      {this.component,
      this.content,
      this.more,
      this.moreAppUrl,
      this.moreUrl,
      this.text,
      this.topContent,
      this.typeName,
      this.updateTime});

  Cards.fromJson(Map<String, dynamic> json) {
    if (json["component"] is String) {
      component = json["component"];
    }
    if (json["content"] is List) {
      content = json["content"] == null
          ? null
          : (json["content"] as List).map((e) => Content.fromJson(e)).toList();
    }
    if (json["more"] is int) {
      more = json["more"];
    }
    if (json["moreAppUrl"] is String) {
      moreAppUrl = json["moreAppUrl"];
    }
    if (json["moreUrl"] is String) {
      moreUrl = json["moreUrl"];
    }
    if (json["text"] is String) {
      text = json["text"];
    }
    if (json["topContent"] is List) {
      topContent = json["topContent"] == null
          ? null
          : (json["topContent"] as List)
              .map((e) => Content.fromJson(e))
              .toList();
    }
    if (json["typeName"] is String) {
      typeName = json["typeName"];
    }
    if (json["updateTime"] is String) {
      updateTime = json["updateTime"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> raw = <String, dynamic>{};
    raw["component"] = component;
    if (content != null) {
      raw["content"] = content?.map((e) => e.toJson()).toList();
    }
    raw["more"] = more;
    raw["moreAppUrl"] = moreAppUrl;
    raw["moreUrl"] = moreUrl;
    raw["text"] = text;
    if (topContent != null) {
      raw["topContent"] = topContent?.map((e) => e.toJson()).toList();
    }
    raw["typeName"] = typeName;
    raw["updateTime"] = updateTime;
    return raw;
  }
}

class Content {
  String? appUrl;
  String? desc;
  String? hotChange;
  String? hotScore;
  String? hotTag;
  String? hotTagImg;
  String? img;
  int? index;
  String? indexUrl;
  String? query;
  String? rawUrl;
  List<dynamic>? show;
  String? url;
  String? word;

  Content(
      {this.appUrl,
      this.desc,
      this.hotChange,
      this.hotScore,
      this.hotTag,
      this.hotTagImg,
      this.img,
      this.index,
      this.indexUrl,
      this.query,
      this.rawUrl,
      this.show,
      this.url,
      this.word});

  Content.fromJson(Map<String, dynamic> json) {
    if (json["appUrl"] is String) {
      appUrl = json["appUrl"];
    }
    if (json["desc"] is String) {
      desc = json["desc"];
    }
    if (json["hotChange"] is String) {
      hotChange = json["hotChange"];
    }
    if (json["hotScore"] is String) {
      hotScore = json["hotScore"];
    }
    if (json["hotTag"] is String) {
      hotTag = json["hotTag"];
    }
    if (json["hotTagImg"] is String) {
      hotTagImg = json["hotTagImg"];
    }
    if (json["img"] is String) {
      img = json["img"];
    }
    if (json["index"] is int) {
      index = json["index"];
    }
    if (json["indexUrl"] is String) {
      indexUrl = json["indexUrl"];
    }
    if (json["query"] is String) {
      query = json["query"];
    }
    if (json["rawUrl"] is String) {
      rawUrl = json["rawUrl"];
    }
    if (json["show"] is List) {
      show = json["show"] ?? [];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["word"] is String) {
      word = json["word"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> raw = <String, dynamic>{};
    raw["appUrl"] = appUrl;
    raw["desc"] = desc;
    raw["hotChange"] = hotChange;
    raw["hotScore"] = hotScore;
    raw["hotTag"] = hotTag;
    raw["hotTagImg"] = hotTagImg;
    raw["img"] = img;
    raw["index"] = index;
    raw["indexUrl"] = indexUrl;
    raw["query"] = query;
    raw["rawUrl"] = rawUrl;
    if (show != null) {
      raw["show"] = show;
    }
    raw["url"] = url;
    raw["word"] = word;
    return raw;
  }
}
