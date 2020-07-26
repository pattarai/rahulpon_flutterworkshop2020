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

  List<int> stack = [];

  TextEditingController z = new TextEditingController();
  String saveData = "";

  var selectedDay;

  _StatefulWidgetDemo() {
    count = 0;
    selectedDay = days[0];
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
          // count++;
        },
      ),
      appBar: AppBar(
        title: Text(count.toString()),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: z,
            onEditingComplete: () {
              stack.add(int.parse(z.text));
              z.text = "";
              setState(() {});
            },
          ),
          Text(printStackVertically()),
          RaisedButton(
            child: Text("Pop"),
            onPressed: () {
              stack.removeLast();
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  String printStackVertically() {
    String x = "";
    stack.reversed.forEach((y) {
      x += y.toString() + "\n";
    });
    return x;
  }
}
