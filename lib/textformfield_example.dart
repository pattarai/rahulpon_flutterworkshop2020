import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StatefulWidgetDemo(),
  ));
}

class StatefulWidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatefulWidgetDemo();
  }
}

class _StatefulWidgetDemo extends State<StatefulWidgetDemo> {
  var count;
  List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];

  TextEditingController textEditingController = new TextEditingController();

  var selectedDay;

  _StatefulWidgetDemo() {
    count = 0;
    selectedDay = days[0];
    textEditingController.text = "This is the old state/text";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            count++;
          });
        },
      ),
      appBar: AppBar(
        title: Text("StatefulWidgetDemo"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: textEditingController,
            onEditingComplete: () {
              setState(() {
                
              });
            },
          ),
          Text(textEditingController.text),
        ],
      ),
    );
  }
}
