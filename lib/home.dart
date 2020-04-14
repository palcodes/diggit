import 'package:diggit/models/meetsModel.dart';
import 'package:diggit/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<User> reqsend() async {
    List<User> users;
    var response = await http.get('https://api.github.com/users');
    if (response.statusCode == 200) {
      print('STATUS ON FIRST REQUEST = 200');
      users = (json.decode(response.body) as List)
          .map((i) => User.fromJson(i))
          .toList();
      final random = new Random();
      var theUser = users[random.nextInt(users.length)];
      print(theUser.url);
    } else {
      print('NULL');
      return null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reqsend();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Text('Lets see'),
            // FutureBuilder(
            //   future: reqsend(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       print(snapshot);
            //       return Column(
            //         children: <Widget>[
            //           Image.network(
            //             snapshot.data.avatarUrl,
            //             fit: BoxFit.cover,
            //             width: 120,
            //             height: 120,
            //           ),
            //           Text(
            //             '\n ${snapshot.data.name} \n Followers: ${snapshot.data.followers} \n Following: ${snapshot.data.following} \n Bio: ${snapshot.data.bio} \n Repos -> ${snapshot.data.reposUrl}',
            //             style: GoogleFonts.poppins(fontSize: 30),
            //           ),
            //         ],
            //       );
            //     } else if (snapshot.hasError) {
            //       return Text('${snapshot.error.toString()}');
            //     } else {
            //       print(snapshot.data);
            //       return Text('Error');
            //     }
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
