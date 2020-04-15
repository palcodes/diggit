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
    var response = await http.get('https://api.github.com/users?per_page=50');
    if (response.statusCode == 200) {
      print('STATUS ON FIRST REQUEST = 200');
      users = (json.decode(response.body) as List)
          .map((i) => User.fromJson(i))
          .toList();
      final random = new Random();
      var theUser = users[random.nextInt(users.length)];
      print(theUser.url);
      var response2 = await http.get(theUser.url);
      var foundUser = Meets.fromJson(json.decode(response2.body));
      print("${foundUser.name} \n ${foundUser.bio}");
    } else {
      print('NULL');
      return null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // reqsend();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              Container(
                color: Color.fromRGBO(30, 33, 37, 1),
                height: 370,
              ),
              Positioned(
                top: 330,
                height: 150,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bio',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      Text(
                        'I am a Mumbai based Software Engineer, looking for new opportunities.',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[800],
                          blurRadius: 30,
                        )
                      ],
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              Positioned(
                left: 42,
                top: 85,
                child: Container(
                  height: 85,
                  width: 85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black, blurRadius: 25, spreadRadius: 10)
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 40,
                bottom: 120,
                child: Text(
                  'Hi I am,',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 30),
                ),
              ),
              Positioned(
                left: 40,
                bottom: 75,
                child: Text(
                  'Calvin Gomez',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 150, left: 45),
            child: Text(
              'People',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 35, right: 35),
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Followers',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500)),
                VerticalDivider(
                  indent: 8,
                  endIndent: 8,
                  width: 2,
                  color: Color.fromRGBO(30, 33, 37, 1),
                ),
                Text('Following',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500)),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey[500], blurRadius: 20)],
                borderRadius: BorderRadius.circular(12)),
          ),
          Container(
            margin: EdgeInsets.only(top: 35, left: 45),
            child: Text(
              'Repositories',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: 20, left: 35, right: 12, bottom: 15),
                    height: 150,
                    width: 230,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(color: Colors.grey[500], blurRadius: 20)
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, right: 12, bottom: 15),
                    height: 150,
                    width: 230,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(color: Colors.grey[500], blurRadius: 20)
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, right: 12, bottom: 15),
                    height: 150,
                    width: 230,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(color: Colors.grey[500], blurRadius: 20)
                        ]),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
