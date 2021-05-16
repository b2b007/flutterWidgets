import 'package:flutter/material.dart';

class BasicSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.orange,
            expandedHeight: 200,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://images.unsplash.com/photo-1618557415287-2e4a3eec7660?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
                fit: BoxFit.cover,
              ),
              title: Text('BasicSliverAppBar'),
              centerTitle: true,
            ),
            /*title: Text('BasicSliverAppBar'),*/
            /*leading: Icon(Icons.arrow_back),*/
            actions: [
              Icon(Icons.settings),
              SizedBox(width: 12),
            ],
          ),
          gridImages(),
        ],
      ),
    );
  }

  Widget gridImages() => SliverToBoxAdapter(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          primary: false,
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (ctx, i) => Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.black12,
            ),
          ),
        ),
      );
}

class TabBarSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                title: Text("TabBarSliverAppBar"),
                centerTitle: true,
                floating: true,
                pinned: true,
                snap: true,
                expandedHeight: 100,
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'Tab1'),
                    Tab(text: 'Tab2'),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              gridImages(),
              gridImages(),
            ],
          ),
        ),
      ),
    );
  }

  Widget gridImages() => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        /*primary: false,
          shrinkWrap: true,*/
        itemCount: 20,
        itemBuilder: (ctx, i) => Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.black12,
          ),
        ),
      );
}
