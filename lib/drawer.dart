import 'package:flutter/material.dart';
import 'package:stateful_widgets/snackbar_demo.dart';
import 'main.dart';
import 'main_bakk.dart';

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class HomeScreen extends StatefulWidget {
  int x = 10;

  var drawerItems = [
    new DrawerItem("Login", Icons.vpn_key),
    new DrawerItem("Stack", Icons.layers),
    new DrawerItem("SnackBars and Toasts", Icons.space_bar),
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
        return Login();
        break;
      case 1:
        return StackDemo();
        break;
      case 2:
        return SnackbarDemo();
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
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
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
        ),
      ),
      drawer: new Drawer(
        child: SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text("Fabian"),
                accountEmail: new Text("fabian@licet.ac.in"),
                currentAccountPicture: CircleAvatar(
                  radius: 60.0,
                  backgroundColor: const Color(0xFF778899),
                  backgroundImage: NetworkImage(
                      "https://pbs.twimg.com/media/EYMLAPaUwAIx4vv.jpg"), // for Network image
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
