class Repos {
  String name;
  String htmlUrl;
  String description;
  String language;

  Repos({this.name, this.htmlUrl, this.description, this.language});

  Repos.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    htmlUrl = json['html_Url'];
    description = json['description'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['html_Url'] = this.htmlUrl;
    data['description'] = this.description;
    data['language'] = this.language;
    return data;
  }
}
