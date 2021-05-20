import 'package:flutter/material.dart';

class BasicPageView extends StatefulWidget {
  @override
  _BasicPageViewState createState() => _BasicPageViewState();
}

class _BasicPageViewState extends State<BasicPageView> {
  PageController pageController = new PageController(initialPage: 0);
  int _index = 0;
  // ignore: non_constant_identifier_names
  final int max_pages = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BasicPageView'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              if (_index > 0) {
                _index -= 1;
              }
              pageController.animateToPage(_index,
                  duration: Duration(milliseconds: 150),
                  curve: Curves.easeInOut);
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {
              if (_index < max_pages - 1) {
                _index += 1;
              }
              pageController.animateToPage(_index,
                  duration: Duration(milliseconds: 150),
                  curve: Curves.easeInOut);
            },
          ),
        ],
      ),
      body: PageView(
        pageSnapping: true,
        scrollDirection: Axis.horizontal,
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            _index = index;
          });
        },
        children: [
          Container(
            color: Colors.indigo,
            child: Center(
              child: Text('Page 1', style: TextStyle(color: Colors.white)),
            ),
          ),
          Container(
            color: Colors.red,
            child: Center(
              child: Text('Page 2', style: TextStyle(color: Colors.white)),
            ),
          ),
          Container(
            color: Colors.brown,
            child: Center(
              child: Text('Page 3', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
