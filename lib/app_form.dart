import 'package:flutter/material.dart';

class AppForm extends StatefulWidget {
  @override
  _AppForm createState() {
    return _AppForm();
  }
}

class _AppForm extends State<AppForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: "Name",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
          ),
          ListTile(
            trailing: IconButton(
              icon: Icon(Icons.public),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => SimpleDialog(
                        titlePadding: EdgeInsets.all(20.0),
                        contentPadding: EdgeInsets.all(20.0),
                        title: Text("this is a name, yo"),
                        children: <Widget>[
                          SimpleDialogOption(
                            child: Text("Yes plz"),
                            onPressed: () {
                              print("Yesh");
                              Navigator.pop(context);
                            },
                          ),
                          SimpleDialogOption(
                            child: Text("no plx"),
                            onPressed: () {
                              print("no");
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                );
              },
            ),
            title: TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: "Name",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, we want to show a Snackbar
                  Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Processing Data'),
                        ),
                      );
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
