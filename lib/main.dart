import 'package:diggit/abstract.dart';
import 'package:diggit/models/meetsModel.dart';
import 'package:diggit/models/reposModel.dart';
import 'package:flutter/material.dart';
import 'package:diggit/home.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));

    return MultiProvider(
      providers: [
        FutureProvider<Meets>.value(
          value: getTheUser(),
        ),
        ChangeNotifierProxyProvider<Meets, ReposNotifier>(
          create: (context) => ReposNotifier(),
          update: (context, meets, repos) => ReposNotifier.fromMeets(meets),
        ),
      ],
      child: MaterialApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        title: 'digGit',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
