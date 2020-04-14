import 'package:diggit/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Meets> reqsend() async {
    final response = await http.get('https://api.github.com/users/gaearon');
    if (response.statusCode == 200) {
      print('STATUS = 200');
      return Meets.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load json');
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
            FutureBuilder(
              future: reqsend(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot);
                  return Column(
                    children: <Widget>[
                      Image.network(
                        snapshot.data.avatarUrl,
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                      ),
                      Text(
                        '\n ${snapshot.data.name} \n Followers: ${snapshot.data.followers} \n Following: ${snapshot.data.following} \n Bio: ${snapshot.data.bio} \n Repos -> ${snapshot.data.reposUrl}',
                        style: GoogleFonts.poppins(fontSize: 30),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error.toString()}');
                } else {
                  print(snapshot.data);
                  return Text('Error');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
