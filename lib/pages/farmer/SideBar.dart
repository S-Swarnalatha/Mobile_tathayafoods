import 'package:flutter/material.dart';
import 'package:somt/Contact.dart';
import 'package:somt/pages/farmer/Address_get.dart';
import 'package:somt/pages/farmer/Post_address.dart';
import 'package:somt/pages/farmer/getMyproducts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  String title = "Single Origin Milk";

  int _currentIndex = 0;

  final tabs = [
    GetView(),
    GetFarmerAddress(),
    FarmerAddress(),
    Contact(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
        ),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 11.0,
        selectedFontSize: 11.0,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.bottleWine,
              size: 30,
            ),
            title: Text(
              'MyProducts',
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            //  backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_identity,
              size: 30,
            ),
            title: Text(
              'Address',
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            //   backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_identity,
              size: 30,
            ),
            title: Text(
              'Add Address',
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            //   backgroundColor: Colors.black,
          ),
              BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_contact_cal_outlined,
              size: 30,
            ),
            title: Text(
              'Contact Us',
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            //   backgroundColor: Colors.black,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
