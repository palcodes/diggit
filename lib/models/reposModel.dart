import 'package:diggit/abstract.dart';
import 'package:diggit/models/meetsModel.dart';
import 'package:flutter/cupertino.dart';

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

class ReposNotifier with ChangeNotifier {
  Meets meets;
  List<Repos> repos;

  ReposNotifier();

  ReposNotifier.fromMeets(Meets meets) {
    fetch(meets);
  }

  void fetch(Meets meets) async {
    repos = await getRepos(meets);
    notifyListeners();
  }
}
