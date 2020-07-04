import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //logo
          Container(),
          //textbox
          TextField(),
          //button
          MaterialButton(
            onPressed: () {},
            color: Color.fromRGBO(30, 33, 37, 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: EdgeInsets.all(8),
            child: Text(
              'Continue with GitHub',
              style: GoogleFonts.poppins(),
            ),
          )
        ],
      ),
    );
  }
}
