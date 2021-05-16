import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/sliverAppBar.dart';
import 'components/pageView.dart';
import 'components/pullToRefresh.dart';
import 'components/drawerView.dart';
import 'components/supabaseAPI.dart';
import 'components/getx.dart';

import 'home.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tests',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/BasicSliverAppBar', page: () => BasicSliverAppBar()),
        GetPage(name: '/TabBarSliverAppBar', page: () => TabBarSliverAppBar()),
        GetPage(name: '/BasicPageView', page: () => BasicPageView()),
        GetPage(name: '/SimplePullToRefresh', page: () => SimplePullToRefresh()),
        GetPage(name: '/SimpleLiquidPullToRefresh', page: () => SimpleLiquidPullToRefresh()),
        GetPage(name: '/SimpleDrawer', page: () => SimpleDrawer()),
        GetPage(name: '/SupabaseAPI', page: () => SupabaseAPI()),
        GetPage(name: '/GetX', page: () => GetXFramework()),
      ],
      home: Home(),
    );
  }
}
