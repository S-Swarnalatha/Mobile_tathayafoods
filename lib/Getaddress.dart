import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetAddress extends StatefulWidget {
  @override
  _GetAddressState createState() => _GetAddressState();
}

class _GetAddressState extends State<GetAddress> {
  List users = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    this.fetchUser();
  }

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var savedValue = preferences.getString('value_token');
    var url = "https://tathayafoods.herokuapp.com/api/address/get";
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer $savedValue',
    });
    // print(response.body);
    if (response.statusCode == 200) { 
      var items = json.decode(response.body)['data'];
      setState(() {
        users = items;
        isLoading = false;
      });
    } else {
      users = [];
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address Details"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (users.contains(null) || users.length < 0 || isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return getCard(users[index]);
        });
  }

  Widget getCard(item) {
        var id = item['_id'];

    var doorNo = item['doorNo'];
    var streetName = item['streetName'];
    var city = item['city'];
    var state = item['state'];
    var pincode = item['pincode'];

    
    return Card(
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60 / 2),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                      child: 
                     
                  Text(
                        "DoorNo:" + doorNo,
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  
                  Text(
                    "StreetName:" + streetName.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                 
                 
                  Text(
                    "City:" + city.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "State:" + state.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                   Text(
                    "pincode:" + pincode.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
