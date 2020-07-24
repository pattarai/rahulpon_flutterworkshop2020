import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
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

  TextEditingController stackElement = new TextEditingController();

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
        },
      ),
      appBar: AppBar(
        title: Text("StatefulWidgetDemo"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(days.toString()),
              Text(count.toString()),
              DropdownButton(
                value: selectedDay,
                items: days.map<DropdownMenuItem<String>>((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDay = days[days.indexOf(value) + 1];
                    count++;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
