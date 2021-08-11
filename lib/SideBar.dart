import 'package:flutter/material.dart';
import 'package:somt/AddAddress.dart';
import 'package:somt/Contact.dart';
import 'pages/user/getProducts.dart';
import 'pages/user/signup.dart';
import 'Getaddress.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                    child: ClipOval(
                      child: Image.network(
                          'https://tse3.mm.bing.net/th?id=OIP.xT_rHGr17us69nReM29OGQHaJB&pid=Api&P=0&w=300&h=300',
                          width: 75,
                          height: 75),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Single Origin  Milk',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              children: <Widget>[
              
                ListTile(
                  title: Text(
                    'Contact Us',
                    style: TextStyle(fontSize: 12),
                  ),
                leading: Icon(Icons.description, size: 29),
                  onTap: () {
                   
                  Navigator.of(context).pop();
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => Contact()),
                   );
                  },
                ),
                ListTile(
                  title: Text(
                    'Add Address',
                    style: TextStyle(fontSize: 12),
                  ),
                  leading: Icon(Icons.view_agenda, size: 29),
                  onTap: () {
                    Navigator.of(context).pop();
                   Navigator.push(
                       context,
                      MaterialPageRoute(builder: (context) =>Address ()),);
                  }
                  
                ),
               
                ListTile(
                  title: Text(
                    'View Address',
                    style: TextStyle(fontSize: 12),
                  ),
                  leading: Icon(Icons.arrow_forward, size: 25.0),
                  onTap: () {
                    Navigator.of(context).pop();
                   Navigator.push(
                       context,
                      MaterialPageRoute(builder: (context) => GetAddress()),);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
