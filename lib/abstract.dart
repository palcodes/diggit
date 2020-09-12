import 'package:diggit/models/meetsModel.dart';
import 'package:diggit/models/reposModel.dart';
import 'package:diggit/models/userModel.dart';

import 'package:dio/dio.dart';

import 'dart:math';

Future<Meets> getTheUser() async {
  try {
    Dio dio = new Dio();
    Response responseForUser;
    Response responseForMeet;
    Random random = new Random();
    responseForUser =
        await dio.get('https://api.github.com/users?per_page=800');
    List<User> users =
        (responseForUser.data as List).map((i) => User.fromJson(i)).toList();
    User theUser = users[random.nextInt(users.length)];
    print("NEW MEET FOUND -> " + theUser.url);
    responseForMeet = await dio.get(theUser.url);
    Meets foundMeet = Meets.fromJson(responseForMeet.data);
    print("${foundMeet.name} \n ${foundMeet.bio}");
    return foundMeet;
  } catch (e) {
    print('CAUGHT ERROR IN getTheUser():' + e.toString());
  }
}

Future<List<Repos>> getRepos(Meets foundMeet) async {
  try {
    Response responseForRepo;
    Dio dio = new Dio();
    print('FOUND USER: ' + foundMeet.url.toString());
    responseForRepo = await dio.get(foundMeet.reposUrl);
    List<Repos> repos =
        (responseForRepo.data as List).map((i) => Repos.fromJson(i)).toList();
    return repos;
  } catch (e) {
    print('CAUGHT ERROR IN getRepos():' + e.toString());
  }
}
