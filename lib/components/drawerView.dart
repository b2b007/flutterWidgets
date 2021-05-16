import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleDrawer'),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 30),
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            Card(child: ListTile(title: Text("item 1"))),
            Card(child: ListTile(title: Text("item 2"))),
            Card(child: ListTile(title: Text("item 3"))),
          ],
        ),
      ),
      body: Center(
        child: Text("Text"),
      ),
    );
  }
}
