import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class SimplePullToRefresh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimplePullToRefresh'),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            Duration(seconds: 1),
          );
        },

        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) => Container(
            width: double.infinity,
            height: 100,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.black12,
            ),
          ), // Container
        ), // ListView.builder
      ), // RefreshIndicator
    );
  }
}

class SimpleLiquidPullToRefresh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleLiquidPullToRefresh'),
        elevation: 0,
      ),
      body: LiquidPullToRefresh(
        showChildOpacityTransition: false,
        springAnimationDurationInMilliseconds: 100,
        //animSpeedFactor: 2.0,
        onRefresh: () {
          return Future.delayed(
            Duration(milliseconds: 500),
          );
        },
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) => Container(
            width: double.infinity,
            height: 100,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.black12,
            ),
          ), // Container
        ), // ListView.builder
      ), // LiquidPullToRefresh
    );
  }
}
