import 'package:flutter/material.dart';
import 'stack.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
    debugShowCheckedModeBanner: false,
  ));
}

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Login();
  }
}

class _Login extends State<Login> {
  TextEditingController _logincontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xfffff1dd),
      appBar: AppBar(
        backgroundColor: Color(0xff9791a0),
        title: Text("Login/Sign up"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Color(0xffd8aeae)),
              child: Column(
                children: <Widget>[
                  Center(child: Text("Enter Username")),
                  TextFormField(
                    controller: _logincontroller,
                  ),
                  Text("Enter password"),
                  TextFormField(
                    controller: _logincontroller,
                  ),
                ],
              ),
            ),
            RaisedButton(
              color: Color(0xff293844),
              child: Text("Log in"),
              onPressed: () {
                print("Someone logged in");
              },
            ),
            InkWell(
              child: Text("Click here to open Stack"),
              onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Stacks()));
            }),
          ],
        ),
      ),
    );
  }
}
