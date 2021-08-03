import 'package:flutter/material.dart';

import '../bloc/bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(),
          passwordField(),
          Container(margin: EdgeInsets.only(top: 20.0)),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapShot) {
        return TextField(
          decoration: InputDecoration(
            hintText: "y@gmail.com",
            labelText: "Email address",
            errorText: snapShot.error,
          ),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget passwordField() {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              labelText: "Password",
              errorText: snapshot.error,
            ),
            onChanged: bloc.changePassword,
          );
        });
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        print('${bloc.email} ${bloc.password}');
      },
      child: Text("Submit"),
    );
  }
}
