import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Aboutus extends StatefulWidget {
  @override
  _AboutusState createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('About Us',style: GoogleFonts.kanit(color: Colors.black),),
      ),
      body: Container(),
    );
  }
}
