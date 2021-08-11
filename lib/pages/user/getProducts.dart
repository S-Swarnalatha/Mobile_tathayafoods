import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:somt/pages/user/userSubscription.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetProducts extends StatefulWidget {
  @override
  _GetProductsState createState() => _GetProductsState();
}

class _GetProductsState extends State<GetProducts> {
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
    var savedValue = preferences.getString('value_token');
    var url = "https://tathayafoods.herokuapp.com/api/products/getall";
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
        title: Text("Products List"),
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

    var productName = item['productName'];
    var productType = item['productType'];
    var price = item['price'];
    var supplier = item['supplier'];
    var productDescription = item['productDescription'];

    var quantity = item['quantity'];
    
    return Card(
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Container(
                width: 20,
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
                        "Name:" + productName,
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                   Text(
                        "ID:" + id,
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                      SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Type:" + productType.toString(),
                    style: TextStyle(color: Colors.black),
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
                    "Price: ₹ " + price.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Farmer:" + supplier.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.redAccent[200],
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 80),
                    shape: StadiumBorder(),
                    child: Text('Order'),
                    onPressed: ()  {
                      
        Clipboard.setData(new ClipboardData(text: id));
                  AlertDialog(title: Text("Id copied!"),);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Subscriber()),
                      );
                    },
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
