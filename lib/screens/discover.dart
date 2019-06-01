import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterpeer/models/app.dart';
import 'package:flutterpeer/screens/project_detail.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          Firestore.instance.collection('apps').orderBy('votes').snapshots(),
      builder: (context, snap) {
        if (!snap.hasData) {
          return LinearProgressIndicator();
        }

        List<App> apps =
            snap.data.documents.map((ds) => App.fromJson(ds.data)).toList();

        if (apps.length == 0) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Nothing here... Create the first app ever in "Home"!',
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          itemCount: apps.length + 1,
          itemBuilder: (context, i) {
            if (i == 0)
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 8),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Discover',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ],
              );

            var app = apps[i - 1];
            return Padding(
              padding: const EdgeInsets.all(12.0),
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
                        /* Expanded(
                          child: Container(),
                        ), */
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
            );
          },
        );
        /* 
              return ProjectList(apps); */
      },
    );
  }
}
