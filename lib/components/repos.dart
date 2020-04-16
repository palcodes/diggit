import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:diggit/models/meetsModel.dart';
import 'package:diggit/main.dart';

class RepoList extends StatefulWidget {
  @override
  _RepoListState createState() => _RepoListState();
}

class _RepoListState extends State<RepoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 35, right: 12, bottom: 15),
      height: 150,
      width: 230,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey[500], blurRadius: 20)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Repo Name',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Language Name',
            style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Colors.grey[500]),
          ),
          Text(
            'Repo description',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
