import 'package:flutter/material.dart';
import 'package:somt/AddAddress.dart';
import 'NotificationPage.dart';
import 'ProfilePage.dart';
import 'SideBar.dart';
import 'home.dart';
import 'pages/user/getProducts.dart';
import 'pages/user/signup.dart';
import 'pages/user/userSubscription.dart';
import 'Getaddress.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  String title = "Tathaya foods";



  int _currentIndex = 0;

  final tabs = [
    GetProducts(),
    Subscriber(),
    NotificationPage(),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800 ),),
        actions: <Widget>[
          RawMaterialButton(
            padding: EdgeInsets.all(0),
              onPressed: (){
                  Navigator.pushNamed(context, '/ScanPage');
              },
        
              child: Icon(MdiIcons.qrcodeScan,size: 30, color: Colors.black,)),

        ],
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
            icon: Icon(MdiIcons.bottleWine,size: 30,),
            title: Text(
              'ORDER',
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            //  backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.shopping,size: 30,),
            title: Text(
              'MYORDERS',
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            //   backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications,size: 30,),
            title: Text(
              'NOTIFICATIONS',
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            backgroundColor: Colors.black,
          ),
         
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

      ),
      drawer: SideBar(),
    );
  }
}
