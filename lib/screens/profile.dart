import 'package:flutter/material.dart';
import 'package:fooddedliveryapp/utils/reuseable_widget.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool appNotification = true;

  bool locationTracing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.exit_to_app
                      ),
                      onPressed: (){},
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: AssetImage('assets/images/user.jpg'),
                          fit: BoxFit.cover
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3
                          )
                        ]
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Sassy Cassy',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'sassaycassy10@gmail.com',
                          style: TextStyle(
                            color: Colors.black54
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        BorderedButton(
                          onTap: (){},
                          labelText: 'Edit',
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 2,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.location_on, color: Colors.blue,),
                        title: Text('Change Location'),
                      ),
                      Divider(
                        height: 10,
                      ),
                      ListTile(
                        leading: Icon(Icons.vpn_key, color: Colors.blue,),
                        title: Text('Change Password'),
                      ),
                      Divider(
                        height: 10,
                      ),
                      ListTile(
                        leading: Icon(Icons.local_shipping, color: Colors.blue,),
                        title: Text('Shipping'),
                      ),
                      Divider(
                        height: 10,
                      ),
                      ListTile(
                        leading: Icon(Icons.payment, color: Colors.blue,),
                        title: Text('Payment'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Card(
                  elevation: 2,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('App Notification'),
                        trailing: Switch.adaptive(
                            value: appNotification,
                            onChanged: (value){
                              setState(() {
                                appNotification = !appNotification;
                              });
                            }
                        ),
                      ),
                      Divider(
                        height: 10,
                      ),
                      ListTile(
                        title: Text('Location Tracing'),
                        trailing: Switch.adaptive(
                            value: locationTracing,
                            onChanged: (value){
                              setState(() {
                                locationTracing = !locationTracing;
                              });
                            }
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
