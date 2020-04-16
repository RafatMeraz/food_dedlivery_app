import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddedliveryapp/utils/reuseable_widget.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Edit Profile',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                          Icons.close,
                        size: 30,
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 150,
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
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(40)
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'email@gmail.com',
                            enabled: false,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'User Name',
                            prefixIcon: Icon(Icons.person, color: Colors.blue,)
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Phone Number',
                              prefixIcon: Icon(Icons.call, color: Colors.blue,)
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RoundButton(labelText: 'Save', onTap: (){})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
