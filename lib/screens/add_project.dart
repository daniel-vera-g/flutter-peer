import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterpeer/models/app.dart';
import 'package:flutterpeer/models/user.dart';
import 'package:flutterpeer/screens/dialog_helper.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class AddProjectPage extends StatefulWidget {
  @override
  _AddProjectPageState createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  final _form = GlobalKey<FormState>();

  App app = App(
      appIconUrl:
          'https://alexisvt.gallerycdn.vsassets.io/extensions/alexisvt/flutter-snippets/1.1.0/1555030508096/Microsoft.VisualStudio.Services.Icons.Default');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(MdiIcons.plus),
        label: Text("Create"),
        onPressed: () async {
          // Validate will return true if the form is valid, or false if
          // the form is invalid.
          if (_form.currentState.validate()) {
            _form.currentState.save();

            showLoadingDialog(context, 'Creating app...');
            // If the form is valid, display a snackbar. In the real world, you'd
            // often want to call a server or save the information in a database
            /*    Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Processing Data'))); */

            app.owner = Provider.of<FirebaseUser>(context).uid;
            var ds = await Firestore.instance
                .collection('user')
                .document(app.owner)
                .get();

            var user = ds.exists
                ? User.fromJson(ds.data)
                : User(
                    email: Provider.of<FirebaseUser>(context).email,
                    name: Provider.of<FirebaseUser>(context).displayName,
                    profilePictureUrl:
                        Provider.of<FirebaseUser>(context).photoUrl);
            app.ownerName = user.name;

            app.following = [];

            app.screenshotUrls = [];
            app.votes = 0;

            Firestore.instance.collection('apps').add(app.toJson());
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          }
        },
      ),
      appBar: AppBar(),
      body: Form(
        key: _form,
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Your project name",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a name for your project';
                  }
                },
                onSaved: (s) => app.name = s,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Your project description",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some description';
                  }
                },
                onSaved: (s) => app.description = s,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Your project category",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a category for your app';
                  }
                },
                onSaved: (s) => app.category = s,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Your project link",
                    border: OutlineInputBorder()),
                onSaved: (s) => app.link = s,
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'Please enter a link to your';
                //   }
                // },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
