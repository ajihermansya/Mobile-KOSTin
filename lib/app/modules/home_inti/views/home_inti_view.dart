import 'package:flutter/material.dart';
import 'package:kostin/app/modules/Listone/views/listone_view.dart';
import 'package:kostin/widget/home_one.dart';

class HomeIntiView extends StatefulWidget {
  const HomeIntiView({super.key});

  @override
  State<HomeIntiView> createState() => _HomeIntiViewState();
}

class _HomeIntiViewState extends State<HomeIntiView> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeOne(),
    ListoneView(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/home.png"),
              color: Color(0xff217DA5),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/search.png"),
              color: Color(0xff217DA5),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/luggage.png"),
              color: Color(0xff217DA5),
            ),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/shopping-bag.png"),
              color: Color(0xff217DA5),
            ),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/question.png"),
              color: Color(0xff217DA5),
            ),
            label: 'Help',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff58A5C6),
        onTap: _onItemTapped,
      ),
    );
  }
}
