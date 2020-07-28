import 'package:flutter/material.dart';

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class HomeScreen extends StatefulWidget {

  var drawerItems = [
    new DrawerItem("Dashboard", Icons.home),
    new DrawerItem("Dashboard", Icons.home),
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  BuildContext _ctx;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Text("Hello World");
        break;
      default:
        return new Text("Error");
        break;
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var drawerOptions = <Widget>[];

    for (var i = 0; i < widget.drawerItems.length; i++) {
        var d = widget.drawerItems[i];
        if (i == 7) {
          drawerOptions.add(
            const Divider(height: 1.0, color: Colors.grey),
          );
        }
        drawerOptions.add(new ListTile(
          leading: new Icon(d.icon),
          title: new Text(
            d.title,
            style: TextStyle(fontFamily: "Poppins"),
          ),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        ));
      }
      return new Scaffold(
        key: scaffoldKey,
        appBar: new AppBar(
          // here we display the title corresponding to the fragment
          // you can instead choose to have a static title
          title: new Text(
            widget.drawerItems[_selectedDrawerIndex].title,
            style: TextStyle(
              fontFamily: "Poppins",
            ),
          ),
        ),
        drawer: new Drawer(
          child: SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: new Text("Name here",
                      style: TextStyle(
                          fontFamily: "Poppins", fontWeight: FontWeight.w600)),
                  accountEmail: new Text("@rahwinside",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: 12)),
                  currentAccountPicture: CircleAvatar(
                    radius: 60.0,
                    backgroundColor: const Color(0xFF778899),
                    backgroundImage: NetworkImage("some URL here"), // for Network image
                  ),
                  decoration: new BoxDecoration(
                    color: Color(0xFF222437),
                  ),
                ),
                new Column(children: drawerOptions)
              ],
            ),
          ),
        ),
        body: _getDrawerItemWidget(_selectedDrawerIndex),
      );
    }
  }
