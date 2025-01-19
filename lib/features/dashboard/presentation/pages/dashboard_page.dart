import 'package:dhikr_reminder/features/dhikr/presentation/pages/dhikr_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Dashboard',
      style: optionStyle,
    ),
    DhikrListPage(),
    Text(
      'Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green.shade100,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FlutterIslamicIcons.lantern),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(FlutterIslamicIcons.tasbihHand),
            label: 'Daily Dhikr',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        onTap: _onItemTapped,
      ),
    );
  }
}
