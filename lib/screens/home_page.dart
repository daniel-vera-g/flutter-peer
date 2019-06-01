import 'package:flutter/material.dart';
import 'package:flutterpeer/screens/add_project.dart';

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
          child: Text(
            'Your projects',
            style: TextStyle(fontSize: 30),
          ),
        ),
        /* 
        ListView() */
        Container(
          height: 200,
          child: ListView(
            // This next line does the trick.
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 160.0,
                color: Colors.red,
              ),
              Container(
                width: 160.0,
                color: Colors.blue,
              ),
              Container(
                width: 160.0,
                color: Colors.green,
              ),
              Container(
                width: 160.0,
                color: Colors.yellow,
              ),
              Container(
                width: 160.0,
                color: Colors.orange,
              ),
            ],
          ),
        ),
        RaisedButton(
          child: Text('Add AppProject'),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddProjectPage()));
          },
        )
      ],
    );
  }
}
