import 'package:flutter/material.dart';
import 'package:spajam/ui/widgets/helper.dart';
import 'package:spajam/utils/uidata.dart';

// @todo 動的にするならStatefullWidgetを使う必要があるが、時間があれば。

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: body(context),
      ),
    );
  }

  /*
   * base parts
   */
  Widget body(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            header(),
            fields(context),
          ],
        ),
      );

  Widget header() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Welcome to ${UIData.appName}",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              // color: Colors.green
            ),
          ),
          space(height: 5.0),
          Text(
            "Sign in to continue",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );

  Widget fields(BuildContext context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _usernameField(),
            _passwordField(),
            space(height: 30.0),
            _signinButton(context),
            space(height: 5.0),
            Text(
              "SIGN IN FOR AN ACCOUNT",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );

  /*
   * user name text field
   */
  Widget _usernameField() => Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
        child: TextField(
          maxLines: 1,
          decoration: InputDecoration(
            hintText: "Enter your username",
            labelText: "Username",
          ),
        ),
      );

  /*
   * password text field
   */
  Widget _passwordField() => Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
        child: TextField(
          maxLines: 1,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "Enter your password",
            labelText: "Password",
          ),
        ),
      );

  /*
   * signin button
   */
  Widget _signinButton(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
        width: double.infinity,
        child: RaisedButton(
          padding: EdgeInsets.all(12.0),
          shape: StadiumBorder(),
          child: Text(
            "SIGN IN",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          // color: Colors.green,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(UIData.homeRoute);
          },
        ),
      );
}
