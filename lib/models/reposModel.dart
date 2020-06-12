import 'package:diggit/abstract.dart';
import 'package:diggit/models/meetsModel.dart';
import 'package:flutter/cupertino.dart';

class Repos with ChangeNotifier {
  String name;
  String htmlUrl;
  String description;
  String language;
  List<Repos> repos;

  Repos({this.name, this.htmlUrl, this.description, this.language});

  Repos.fromMeets(Meets meets) {
    getRepos(meets);
  }

  void fetch(Meets meets) async {
    repos = await getRepos(meets);
    notifyListeners();
  }

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
