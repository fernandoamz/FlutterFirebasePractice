import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => new _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{

  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  void validateAndSave(){
    final form = formKey.currentState;

    if(form.validate()){
      print('form is valid email: $_email, password: $_password');
    }else{
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter login demo'),
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Usuario'),
                validator: (value) => value.isEmpty ? 'Ingresar usuario' : null,
                onSaved: (value) => _email = value,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: (value) => value.isEmpty ? 'Ingresar contraseña' : null,
                onSaved: (value) => _password = value,
              ),
              new RaisedButton(
                  child: new Text('Login', style: new TextStyle(fontSize: 20.0)),
                  onPressed: validateAndSave,
              )
            ],
          )
        )
      ),
    );
  }
}