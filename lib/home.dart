import 'package:flutter/material.dart';
import 'package:test_flutter/dashboard.dart';
import 'package:test_flutter/helpdesk.dart';
import 'package:test_flutter/setting.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _pages = [];
  int _page = 0;

  @override
  void initState() {
    _pages = [Dashboard(), Setting(), Helpdesk()];
    super.initState();
  }

  BottomNavigationBarItem _makeItem(int index) {
    const images = ["assets/home.png", "assets/blind.png", "assets/helpdesk.png"];

    var image = (images)[index];
    var selected = index == _page;
    Widget container =
        Image.asset(image, color: selected ? Colors.black : Colors.grey, height: 30, width: 30);

    if (index == 1) {
      container = ElevatedButton(
          child: Image.asset(image, height: 30, width: 30),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: Colors.black,
              fixedSize: const Size(80, 80),
              shape: const CircleBorder(),
              elevation: 8));
    }

    return BottomNavigationBarItem(label: '', icon: container);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(children: _pages, index: _page),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: BottomNavigationBar(
              currentIndex: _page,
              onTap: (index) {
                setState(() {
                  _page = index;
                });
              },
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedFontSize: 0,
              items: [_makeItem(0), _makeItem(1), _makeItem(2)])),
    );
  }
}
