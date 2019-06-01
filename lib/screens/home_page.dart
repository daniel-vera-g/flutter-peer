import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterpeer/models/app.dart';
import 'package:flutterpeer/screens/add_project.dart';
import 'package:flutterpeer/screens/project_detail.dart';
import 'package:provider/provider.dart';

class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Your projects',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              FloatingActionButton(
                mini: true,
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddProjectPage()));
                },
              ),
              /* FloatingActionButton.extended(
                icon: Icon(Icons.add),
                label: Text('Add'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddProjectPage()));
                },
              ) */
            ],
          ),
        ),
        /* 
        ListView() */
        Container(
          height: 200,
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection('apps')
                .where('owner',
                    isEqualTo: Provider.of<FirebaseUser>(context).uid)
                .snapshots(),
            builder: (context, snap) {
              if (!snap.hasData) {
                return Container();
              }

              List<App> apps = snap.data.documents
                  .map((ds) => App.fromJson(ds.data))
                  .toList();

              return ProjectList(apps);
            },
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Following',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection('apps')
                .where('owner',
                    isEqualTo: Provider.of<FirebaseUser>(context).uid)
                .snapshots(),
            builder: (context, snap) {
              if (!snap.hasData) {
                return Container();
              }

              List<App> apps = snap.data.documents
                  .map((ds) => App.fromJson(ds.data))
                  .toList();

              return ProjectList(apps);
            },
          ),
        ),
      ],
    );
  }
}

class ProjectList extends StatelessWidget {
  final List<App> apps;
  ProjectList(this.apps);
  @override
  Widget build(BuildContext context) {
    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      children: apps
          .map((app) => Container(
                height: 300,
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Container(
                                    child: Image.network(app.appIconUrl),
                                    height: 60,
                                  ),
                                ),
                                Container(
                                  width: 190,
                                  child: Text(
                                    app.name,
                                    style: TextStyle(
                                      fontSize: 21,
                                      /*  fontWeight: FontWeight.bold */
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                app.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            /* Text(
                                        app.category,
                                      ), */
                            Expanded(
                              child: Container(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 6, left: 6, bottom: 6),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      app.category,
                                    ),
                                  ),
                                  Text(
                                    app.ownerName,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProjectDetailScreen(app)));
                      },
                    ),
                  ),
                ),
              ))
          .toList(),
    );
    ;
  }
}
