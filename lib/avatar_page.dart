import 'package:flutter/material.dart';

class AvatarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  static final formKey = new GlobalKey<FormState>();

  String _name = '';

  void _updateName(String name) {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {});
      print('Saved: $_name');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Greeting, Robot')),
      body: new Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              _buildInputForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputForm() {
    var children = [
      new VerticalPadding(
          child: new TextFormField(
        decoration: new InputDecoration(
          labelText: 'Enter your unique identifier',
          labelStyle: new TextStyle(fontSize: 20.0),
        ),
        style: new TextStyle(fontSize: 24.0, color: Colors.black),
        validator: (val) => val.isEmpty ? 'Name can\'t be empty' : null,
        onSaved: (name) => _name = name,
        onFieldSubmitted: (name) => _updateName(name),
      ))
    ];

    return new Form(
      key: formKey,
      child: new Column(
        children: children,
      ),
    );
  }
}

class VerticalPadding extends StatelessWidget {
  VerticalPadding({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: child,
    );
  }
}
