import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class GetXFramework extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Get'),
          bottom: TabBar(
            isScrollable: true,
            tabs: <Tab>[
              Tab(text: 'Obx'),
              Tab(text: 'Ui'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            obxView(),
            uiView(),
          ],
        ),
      ),
    );
  }

  Widget obxView() {
    final Controller c = Get.put(Controller());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Obx(() => Text('${c.count}')),
        TextButton(
          onPressed: () {
            //c.increment();
            c.count += 1;
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: Text('Click me!', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget uiView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {
            Get.snackbar('Hi', 'Message');
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.pink,
          ),
          child: Text('Snackbar', style: TextStyle(color: Colors.white)),
        ),
        SizedBox(height: 12),
        TextButton(
          onPressed: () {
            Get.defaultDialog(
              title: 'I am dialog',
              content: Text('Hello?'),
            );
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.pink,
          ),
          child: Text('Dialog', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
