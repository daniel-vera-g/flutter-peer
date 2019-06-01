import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterpeer/models/app.dart';
import 'package:flutterpeer/models/user.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailScreenState extends State<ProjectDetailScreen> {
  App get app => widget.app;

  @override
  Widget build(BuildContext context) {
    print(app.screenshotUrls);
    return Scaffold(
      appBar: AppBar(title: Text(app.name)),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (app.screenshotUrls.length > 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Screenshots',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 400,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: app.screenshotUrls
                            .map((s) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    s,
                                  ),
                                ))
                            .toList()),
                  ),
                ],
              ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(app.description),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Colors.red,
                  child: Text('Follow'),
                  onPressed: () {
                    Firestore.instance
                        .collection('apps')
                        .document(app.uid)
                        .updateData(
                      {
                        'following': app.following
                          ..add(Provider.of<FirebaseUser>(context).uid)
                      },
                    );
                  },
                ),
                RaisedButton(
                  color: Colors.green,
                  child: Text('Vote (${app.votes} Votes)'),
                  onPressed: () {
                    app.votes += 1;
                    Firestore.instance
                        .collection('apps')
                        .document(app.uid)
                        .updateData(
                      {'votes': app.votes},
                    );
                    setState(() {});
                  },
                ),
              ],
            )

            /*    Container(
              padding: const EdgeInsets.all(32),
              child: Text(
                'Collaborators',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ), */
            /*   Container(
              child: InkWell(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: ClipOval(
                        child: Image.network(
                          'https://avatars1.githubusercontent.com/u/31253215?v=4',
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        'Rody Davis',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_right),
                        tooltip: 'View profile',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  /*      Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecondRoute())); */
                },
              ),
            ), */
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var ds = await Firestore.instance
              .collection('user')
              .document(app.owner)
              .get();

          var user = ds.exists ? User.fromJson(ds.data) : null;
          if (user == null || user.email == null) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: ListTile(
                        title: Text('This user has no E-Mail!'),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ));
          } else {
            print(user.email);
            String email =
                'mailto:${user.email}?subject=Flutter App "${app.name}"&body=Hello ${user.name},\n';
            launch(email);
          }
        },
        child: Icon(Icons.mail),
      ),
    );
  }
}

class ProjectDetailScreen extends StatefulWidget {
  final app;
  ProjectDetailScreen(this.app);
  @override
  ProjectDetailScreenState createState() => ProjectDetailScreenState();
}
