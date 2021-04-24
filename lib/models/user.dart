class User {
  String _email;
  String _tokens;
  User(this._email, this._tokens);

  User.map(dynamic obj) {
    this._email = obj["email"];
    this._tokens = obj["tokens"];
  }

  String get username => _email;
  String get password => _tokens;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = _email;
    map["tokens"] = _tokens;

    return map;
  }
}
