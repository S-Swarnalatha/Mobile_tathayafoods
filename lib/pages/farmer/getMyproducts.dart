import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetView extends StatefulWidget {
  @override
  _GetViewState createState() => _GetViewState();
}

class _GetViewState extends State<GetView> {
  List users = [];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
  }

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
     SharedPreferences preferences = await SharedPreferences.getInstance();
    // String token = sharedPrefs.getString('token');
        var savedValue = preferences.getString('value_key');
 print(savedValue);

    var url = "https://tathayafoods.herokuapp.com/api/farmer/myproducts";

    var response = await http.get(url, headers: {
      'Authorization':
          'Bearer $savedValue',
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
        title: (Text("My Products")),
       ) ,
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
    var productName = item['productName'];
    var price = item['price'];
    var productDescription = item['productDescription'];
    var productType = item['productType'];

    var quantity = item['quantity'];

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
                      width: MediaQuery.of(context).size.width - 140,
                      child: Text(
                        "Name:" + productName,
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                        "Type:" + productType,
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Description:" + productDescription.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Quantity:" + quantity.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Price: ₹" + price.toString(),
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
