class Review {
  late String _username;
  late DateTime _createdAt;
  late String _content;

  Review(String username, DateTime createdAt, String content) {
    this._username = username;
    this._createdAt = createdAt;
    this._content = content;
  }

  String get getUsername {
    return _username;
  }

  DateTime get getCreatedAt {
    return _createdAt;
  }

  String get getContent {
    return _content;
  }
}
