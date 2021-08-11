import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final String _delivered = 'Your milk is delivered';
  final String _CTdelivered = '7:20 am';
  final String _outDeliver = 'Your milk is out for delivery';
  final String _CToutDeliver = '7:10 am';
  final String _processStart = 'Milking process has been started';
  final String _CTprocessStart = '7:00 am';
  final String _orderReceived = 'Your order has been received';
  final String _CTorderReceived = '6:30 am';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: ListView(children: <Widget>[
            
            
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.check_circle,
                            size: 35,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(width: 30),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  _delivered,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Text(
                                  _CTdelivered,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.directions_bike,
                            size: 35,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(width: 30),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  _outDeliver,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Text(
                                  _CToutDeliver,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.local_drink,
                            size: 35,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(width: 30),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  _processStart,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Text(
                                  _CTprocessStart,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.check_circle,
                            size: 35,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(width: 30),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  _orderReceived,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Text(
                                  _CTorderReceived,
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
