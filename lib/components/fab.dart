import 'package:flutter/material.dart';

class FAB extends StatelessWidget {
  final Function launchUrl;

  FAB({@required this.launchUrl});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: launchUrl,
        elevation: 22,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/GitHub-Mark-120px-plus.png'),
            ),
          ),
        ));
  }
}
