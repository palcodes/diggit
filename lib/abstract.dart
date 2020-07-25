import 'package:diggit/models/meetsModel.dart';
import 'package:diggit/models/reposModel.dart';
import 'package:diggit/models/userModel.dart';

// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

// import 'dart:convert';
import 'dart:math';

Future<Meets> getTheUser() async {
  try {
    Dio dio = new Dio();
    Response responseForUser;
    Response responseForMeet;
    Random random = new Random();
    // http.Response response =
    //     await http.get('https://api.github.com/users?per_page=800');
    responseForUser =
        await dio.get('https://api.github.com/users?per_page=800');
    List<User> users =
        (responseForUser.data as List).map((i) => User.fromJson(i)).toList();
    User theUser = users[random.nextInt(users.length)];
    print("NEW MEET FOUND -> " + theUser.url);
    // http.Response resInfo = await http.get(theUser.url);
    responseForMeet = await dio.get(theUser.url);
    Meets foundMeet = Meets.fromJson(responseForMeet.data);
    print("${foundMeet.name} \n ${foundMeet.bio}");
    return foundMeet;
  } catch (e) {
    print('CAUGHT ERROR IN getTheUser:' + e.toString());
    return null;
  }
}

Future<List<Repos>> getRepos(Meets foundMeet) async {
  try {
    Response responseForRepo;
    Dio dio = new Dio();
    print('FOUND USER: ' + foundMeet.url.toString());
    // http.Response resRepo = await http.get(foundUser.reposUrl);
    responseForRepo = await dio.get(foundMeet.reposUrl);
    List<Repos> repos =
        (responseForRepo.data as List).map((i) => Repos.fromJson(i)).toList();
    return repos;
  } catch (e) {
    print('CAUGHT ERROR IN getRepos:' + e.toString());
    return null;
  }
}
