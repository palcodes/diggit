import 'package:flutter/material.dart';

// The abstracted FAB on the home screen that
// helps you check the person out on the official Github
// either through the app (if installed) or a browser instance. 🙌
class FAB extends StatelessWidget {
  final Function launchUrl;

  FAB({@required this.launchUrl});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: launchUrl,
        elevation: 42,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: Colors.purple),
            image: DecorationImage(
              image: AssetImage('assets/GitHub-Mark-120px-plus.png'),
            ),
          ),
        ));
  }
}
