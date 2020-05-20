import 'package:diggit/models/meetsModel.dart';
import 'package:diggit/models/reposModel.dart';
import 'package:diggit/models/userModel.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:math';

Future<User> getTheUser() async {
  http.Response response =
      await http.get('https://api.github.com/users?per_page=200');
  List<User> users = (json.decode(response.body) as List)
      .map((i) => User.fromJson(i))
      .toList();
  Random random = new Random();
  User theUser = users[random.nextInt(users.length)];
  print("NEW MEET FOUND -> " + theUser.url);
  return theUser;
}

Future<Meets> infoFoundUser(User theUser) async {
  http.Response resInfo = await http.get(theUser.url);
  Meets foundUser = Meets.fromJson(json.decode(resInfo.body));
  print("${foundUser.name} \n ${foundUser.bio}");
  return foundUser;
}

Future<List<Repos>> getRepos(User theUser) async {
  http.Response resRepo = await http.get(theUser.reposUrl);
  List<Repos> repos = (json.decode(resRepo.body) as List)
      .map((i) => Repos.fromJson(i))
      .toList();
  return repos;
}
