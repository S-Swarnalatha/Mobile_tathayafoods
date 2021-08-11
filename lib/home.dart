import 'package:flutter/material.dart';
import 'package:somt/pages/farmer/farmer_login.dart';
import 'package:somt/pages/user/login_page.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SOMT App'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'TATHAYA FOODS',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
               
                SizedBox(
                  height: 15,
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Make Your Health Smile",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    )),
                      SizedBox(
                  height: 5,
                ),
               
                    
                new Container(
                  width: 100.00,
                  height: 100.00,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: ExactAssetImage('foods.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                    child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 100),
                  shape: StadiumBorder(),
                  child: Text('Login as a Farmer'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FarmerLoginPage()),
                    );
                  },
                )),
                SizedBox(height: 25),
                Container(
                    child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 100),
                  shape: StadiumBorder(),
                  child: Text('Login as a User'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                )),
              ],
            )));
  }
}
