import 'package:diggit/abstract.dart';
import 'package:diggit/models/meetsModel.dart';
import 'package:diggit/models/reposModel.dart';
import 'package:diggit/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:diggit/home.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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

    return MultiProvider(
      providers: [
        FutureProvider.value(
          value: getTheUser(),
        ),
        // FutureProvider(
        //   create: (context) async {
        //     Meets meets;
        //     await meets.fetch();
        //     return meets;
        //   },
        // ),
        // ChangeNotifierProxyProvider<User, Meets>(
        //     create: (context) => Meets(),
        //     update: (context, user, meets) {
        //       meets.fetch();
        //       return meets;
        //     }
        //     // update: (context, user, meets) => Meets.fromUser(),
        //     ),
        // ChangeNotifierProxyProvider<Meets, Repos>(
        //     create: (context) => Repos(),
        //     update: (context, meets, repos) {
        //       repos.fetch(meets);
        //       return repos;
        //     }),
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
