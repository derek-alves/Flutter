import 'package:covidados/features/presenter/dataPage/data_page.dart';
import 'package:covidados/features/presenter/homePage/home_page.dart';
import 'package:flutter/material.dart';

class TabsPages extends StatefulWidget {
  @override
  _TabsPagesState createState() => _TabsPagesState();
}

class _TabsPagesState extends State<TabsPages> {
  int _selectedScreenIndex = 0;
  late List<Widget> _screen;

  @override
  void initState() {
    super.initState();
    _screen = [
      HomePage(),
      DataPage(),
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        selectedItemColor: Theme.of(context).accentColor,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Dados",
          ),
        ],
      ),
    );
  }
}
