import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart'; class AddProjectPage extends StatefulWidget { @override
  _AddProjectPageState createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  final _nameForm = GlobalKey<FormState>();
  final _descriptionForm = GlobalKey<FormState>();
  final _categoryForm = GlobalKey<FormState>();
  final _linkForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(MdiIcons.plus),
        label: Text("Create"),
        onPressed: () {
          // Validate will return true if the form is valid, or false if
          // the form is invalid.
          if (_nameForm.currentState.validate() |
              _descriptionForm.currentState.validate() |
              _categoryForm.currentState.validate()) {
            // If the form is valid, display a snackbar. In the real world, you'd
            // often want to call a server or save the information in a database
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Processing Data')));
          }
        },
      ),
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _nameForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Your project name",
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a name for your project';
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _descriptionForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Your project description",
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some description';
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _categoryForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Your project category",
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a category for your app';
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _linkForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Your project link",
                        border: OutlineInputBorder()),
                    // validator: (value) {
                    //   if (value.isEmpty) {
                    //     return 'Please enter a link to your';
                    //   }
                    // },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
