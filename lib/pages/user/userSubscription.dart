import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:somt/api/subscribe_api.dart';
import 'package:somt/model/subscribe_model.dart';
import 'package:somt/pages/user/scan.dart';
import '../../ProgressHUD.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Subscriber extends StatefulWidget {
  @override
  _SubscribePageState createState() => _SubscribePageState();
}



class _SubscribePageState extends State<Subscriber> {
 
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  SubscribeRequestModel subscribeRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    subscribeRequestModel = new SubscribeRequestModel();
  
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
                          "Customer Subscribe",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                              subscribeRequestModel.Product = input,
                          decoration: new InputDecoration(
                            hintText: "Paste the Id",
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


                        DateTimePicker(
                            dateMask: 'd MMM, yyyy',
                            initialValue: '',
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            dateLabelText: 'Start Date',
                            validator: (input) {
                              return null;
                            },
                            onSaved: (input) =>
                                subscribeRequestModel.start = input),

                        DateTimePicker(
                            initialValue: '',
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            dateLabelText: 'End Date',
                            
                            validator: (input) {
                              return null;
                            },
                            onSaved: (input) =>
                                subscribeRequestModel.end = input),

                 
                        SizedBox(height: 30),
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                          onPressed: () {
                            if (validateAndSave()) {
                              print(subscribeRequestModel.toJson());

                              setState(() {
                                isApiCallProcess = true;
                              });

                              SubscribeAPI apiService = new SubscribeAPI();
                              apiService
                                  .subscribe(subscribeRequestModel)
                                  .then((value) {
                                if (value != null) {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });
                                  if (value.data.isNotEmpty) {
                                    final snackBar = SnackBar(
                                        content: Text(
                                            "Subscribe Successful by you"));
                                    scaffoldKey.currentState
                                        .showSnackBar(snackBar);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Scan()),
                                    );
                                  } else {
                                    final snackBar = SnackBar(
                                        content: Text("not Signned in"));
                                    scaffoldKey.currentState
                                        .showSnackBar(snackBar);
                                  }
                                }
                              });
                            }
                          },
                          child: Text(
                            "Subscribe",
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
