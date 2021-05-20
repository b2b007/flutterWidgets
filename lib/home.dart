import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final List componentName = [
    "BasicSliverAppBar",
    "TabBarSliverAppBar",
    "BasicPageView",
    "SimplePullToRefresh",
    "SimpleLiquidPullToRefresh",
    "SimpleDrawer",
    "SupabaseAPI",
    "GetX",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('b2b studio'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => null,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          itemCount: componentName.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(componentName[index]),
                onTap: () {
                  Get.toNamed('/' + componentName[index]);
                },
              ), // ListTile
            ); // Card
          },
        ), // ListView
      ), // SingleChildScrollView
    ); // Scaffold;
  }
}
