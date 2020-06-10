class User {
  // String login;
  // int id;
  String url;

  User({
    // this.login,
    // this.id,
    this.url,
  });

  User.fromJson(Map<String, dynamic> json) {
    // login = json['login'];
    // id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['login'] = this.login;
    // data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}
