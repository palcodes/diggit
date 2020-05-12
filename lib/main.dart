import 'package:flutter/material.dart';
import 'package:diggit/home.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  //    SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(statusBarBrightness: Brightness.light)
  // );
    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      title: 'digGit',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
