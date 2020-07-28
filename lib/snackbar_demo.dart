import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class SnackbarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SnackbarDemo();
  }
}

class _SnackbarDemo extends State<SnackbarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RaisedButton(
              child: Text("Press here to show a Snackbar"),
              onPressed: () {
                var snackbar = SnackBar(
                  content: Text("This is a snackbar!"),
                );
                Scaffold.of(context).showSnackBar(snackbar);
              }),
          RaisedButton(
            child: Text("Show a Toast message"),
            onPressed: () {
              Toast.show("This is a toast message", context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
            },
          ),
        ],
      ),
    );
  }
}
