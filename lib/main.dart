import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Stack()));
}

class Stack extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Stack();
  }
}

class _Stack extends State<Stack> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Demo"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(
              "Enter a number to push into the stack:",
              textAlign: TextAlign.center,),
            TextFormField(),
            Padding(padding: EdgeInsets.all(10),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("Push"),
                  onPressed: null,
                ),
                Padding(padding: EdgeInsets.all(10),),
                RaisedButton(
                  child: Text("Pop"),
                  onPressed: null,
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(10),),
            Text(
              "Elements in the stack are:",
              textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
