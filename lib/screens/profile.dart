import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterpeer/models/user.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Future fetchFirebaseData() async {
    var ds =
        await Firestore.instance.collection('user').document(app.owner).get();

    var user = ds.exists
        ? User.fromJson(ds.data)
        : User(
            email: Provider.of<FirebaseUser>(context).email,
            name: Provider.of<FirebaseUser>(context).displayName,
            profilePictureUrl: Provider.of<FirebaseUser>(context).photoUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
      color: Colors.white,
      child: new ListView(
        children: <Widget>[
          Column(
            // Image of the User
            children: <Widget>[
              new Container(
                height: 250.0,
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    // Use image
                    // TODO fetch firebase user image
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: new Stack(fit: StackFit.loose, children: <Widget>[
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                                width: 140.0,
                                height: 140.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://raw.githubusercontent.com/flutter-devs/flutter_profileview_demo/master/assets/images/as.png"),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),

                        // Change Use image
                        // TODO be able to change use image
                        Padding(
                            padding: EdgeInsets.only(top: 90.0, right: 100.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 25.0,
                                  child: new Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
                      ]),
                    )
                  ],
                ),
              ),
              new Container(
                color: Color(0xffFFFFFF),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // Information of the user
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Personal Information',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),

                      // Name of the user
                      // TODO add custom name of user
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new FutureBuilder(
                                    future: fetchFirebaseData(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        if (snapshot.data != null) {
                                          return new Column(
                                            children: <Widget>[
                                              new Expanded(
                                                  child: new ListView(
                                                // children: _getData(snapshot),
                                                children: <Widget>[
                                                  Text(snapshot.data.name),
                                                ]
                                              ))
                                            ],
                                          );
                                        }
                                      } else {
                                        return new Text("Your name could not be found");
                                      }
                                    },
                                  ),
                                  // new Text(
                                  //   'Name',
                                  //   style: TextStyle(
                                  //       fontSize: 16.0,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                // TODO add name
                                child: Text("Your name"),
                              ),
                            ],
                          )),

                      // The email of the user
                      // TODO add custom email from firebase or
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Email',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,

                            // children: <Widget>[
                            //   new Flexible(
                            //     // TODO add email
                            //     child: Text("Your email"),
                            //   ),
                            // ],
                          )),

                      // Logout
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(),
                                  ),
                                  RaisedButton(
                                      color: Colors.red,
                                      child: Text("Logout"),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (_) => new AlertDialog(
                                                  title: new Text("Log out?"),
                                                  content: Text(
                                                      "Do you really want to log out?"),
                                                  actions: <Widget>[
                                                    // usually buttons at the bottom of the dialog
                                                    new FlatButton(
                                                      textColor: Colors.black,
                                                      child: new Text("No"),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    RaisedButton(
                                                      child: Text("Yes"),
                                                      textColor: Colors.black,
                                                      onPressed: () async {
                                                        await FirebaseAuth
                                                            .instance
                                                            .signOut();
                                                        Navigator.of(context)
                                                            .pushReplacementNamed(
                                                                '/login');
                                                      },
                                                    )
                                                  ],
                                                ));
                                      }

                                      // onPressed: () async {
                                      //   // TODO add dialog when before log out
                                      //   await FirebaseAuth.instance.signOut();
                                      //   Navigator.of(context)
                                      //       .pushReplacementNamed('/login');
                                      // },
                                      )
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
