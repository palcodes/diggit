class Meets {
  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String reposUrl;
  String name;
  String bio;
  int followers;
  int following;

  Meets({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.reposUrl,
    this.name,
    this.followers,
    this.following,
  });

  Meets.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    reposUrl = json['repos_url'];
    name = json['name'];
    bio = json['bio'];
    followers = json['followers'];
    following = json['following'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['id'] = this.id;
    data['node_id'] = this.nodeId;
    data['avatar_url'] = this.avatarUrl;
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['followers_url'] = this.followersUrl;
    data['following_url'] = this.followingUrl;
    data['repos_url'] = this.reposUrl;
    data['name'] = this.name;
    data['bio'] = this.bio;
    data['followers'] = this.followers;
    data['following'] = this.following;
    return data;
  }
}
