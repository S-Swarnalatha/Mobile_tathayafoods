import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:somt/Getaddress.dart';
import 'package:somt/api/address_api.dart';
import 'package:somt/home.dart';
import 'package:somt/model/address.dart';
import 'package:somt/pages/user/login_page.dart';

import 'ProgressHUD.dart';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  AddressRequestModel addressRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    addressRequestModel = new AddressRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 25),
                        Text(
                          "Add Address",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                              addressRequestModel.doorNo = input,
                          decoration: new InputDecoration(
                            hintText: "Enter doorNo",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                            
                          ),
                        ),
                        new TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                              addressRequestModel.streetName = input,
                          decoration: new InputDecoration(
                            hintText: "Enter streetName",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                           
                          ),
                        ),
                        new TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                              addressRequestModel.city = input,
                          decoration: new InputDecoration(
                            hintText: "Enter City",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                           
                          ),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => addressRequestModel.state = input,
                         
                          decoration: new InputDecoration(
                            hintText: "Enter your State",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                          ),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                              addressRequestModel.pincode = input,
                         
                          decoration: new InputDecoration(
                            hintText: "EnterPincode",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                         
                            
                          ),
                        ),
                        SizedBox(height: 30),
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                          onPressed: () {
                            if (validateAndSave()) {
                              print(addressRequestModel.toJson());

                              setState(() {
                                isApiCallProcess = true;
                              });

                              AddressAPI apiService = new AddressAPI();
                              apiService
                                  .address(addressRequestModel)
                                  .then((value) {
                                if (value != null) {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });

                                  if (value.msg.isNotEmpty) {
                                    final snackBar = SnackBar(
                                        content:
                                            Text("Address added Successful by you"));
                                    scaffoldKey.currentState
                                        .showSnackBar(snackBar);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                    );
                                  } else {
                                    final snackBar = SnackBar(
                                        content: Text("Not able to add address"));
                                    scaffoldKey.currentState
                                        .showSnackBar(snackBar);
                                  }
                                }
                              });
                            }
                          },
                          child: Text(
                            "Add Address",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Theme.of(context).accentColor,
                          shape: StadiumBorder(),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
