import 'package:flutter/material.dart';
import '../UI/card1.dart';
import '../UI/card2.dart';
import '../UI/card3.dart';
import '../UI/cart4.dart';
import '../models/addtask.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    Ecran1(),
    Ecran2(),
    Ecran3(),
    EcranSettings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TD2 App',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: pages[_selectedIndex],
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTask()),
                );
              },
              child: const Icon(Icons.add),
            )
          : const SizedBox.shrink(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Card1'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Card2'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Card3'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Card4'),
        ],
      ),
    );
  }
}
