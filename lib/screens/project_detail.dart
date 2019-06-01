import 'package:flutter/material.dart';
import 'package:flutterpeer/models/app.dart';

class ProjectDetailScreenState extends State<ProjectDetailScreen> {
  App get app => widget.app;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(app.name)),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
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
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      'https://flutter.dev/assets/create/pocket_piano_new-e9f425fa8590be483ea1cd17bd58f383b391bbf5b916b5d328ade4cb0c00067b.gif',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(32),
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(app.description),
            Container(
              padding: const EdgeInsets.all(32),
              child: Text(
                'Collaborators',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
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
            ),
          ],
        ),
      )),
    );
  }
}

class ProjectDetailScreen extends StatefulWidget {
  final app;
  ProjectDetailScreen(this.app);
  @override
  ProjectDetailScreenState createState() => ProjectDetailScreenState();
}
