import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Contact());
}

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: ContactUs(
          companyColor: Colors.white,
          taglineColor: Colors.white,
          email: 'tathayafoods@gmail.com',
          companyName: 'Tathaya Foods!!',
          phoneNumber: '+91123456789',
         // telephone: '+91123456789',
          tagLine: 'Any Queries Contact Us',

          textColor: Colors.black,
          
        ),
        bottomNavigationBar: ContactUsBottomAppBar(
          companyName: 'Tathaya foods',
          textColor: Colors.white,
          backgroundColor: Colors.teal.shade300,
          email: 'tathayafoods@gmail.com',
        ),
      ),
    );
  }
}