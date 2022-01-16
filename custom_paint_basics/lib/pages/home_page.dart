
import 'package:flutter/material.dart';

import 'pages.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? controller;

  List<String> tabLabels = [
    'Line',
    'Circle',
    'Rectangle',
    'Triangle',
    'Curves',
    'Smiley🙂',
  ];

  List<Widget> tabPages = [
    LinePage(),
    CirclePage(),
    RectanglePage(),
    TrianglePage(),
    CurvesPage(),
    SmileyPage(),
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: tabLabels.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Custom Paint Basics'),
        bottom: TabBar(
          isScrollable: true,
          controller: controller,
          tabs: [for (String label in tabLabels) Tab(text: label)],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [for (Widget page in tabPages) page],
      ),
    );
  }
}
