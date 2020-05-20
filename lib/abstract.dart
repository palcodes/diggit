import 'package:diggit/models/meetsModel.dart';
import 'package:diggit/models/reposModel.dart';
import 'package:diggit/models/userModel.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:math';

class AbstractedFunc {
  List<User> users;
  List<Repos> repos;

  Future<User> getTheUser() async {
    var response = await http.get('https://api.github.com/users?per_page=200');
    users = (json.decode(response.body) as List)
        .map((i) => User.fromJson(i))
        .toList();
    final random = new Random();
    var theUser = users[random.nextInt(users.length)];
    print("NEW MEET FOUND -> " + theUser.url);
    return theUser;
  }

  Future<Meets> infoFoundUser(theUser) async {
    var resInfo = await http.get(theUser.url);
    var foundUser = Meets.fromJson(json.decode(resInfo.body));
    print("${foundUser.name} \n ${foundUser.bio}");
    return foundUser;
  }

  Future<List<Repos>> getRepos(theUser) async {
    var resRepo = await http.get(theUser.reposUrl);
    repos = (json.decode(resRepo.body) as List)
        .map((i) => Repos.fromJson(i))
        .toList();
    return repos;
  }
}
