import 'dart:developer' as developer;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_flutter_app/src/features/dashboard_screen.dart';
import 'package:my_flutter_app/src/features/history/screens/view_history_screen.dart';
import 'package:my_flutter_app/src/features/maintenance_screen.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key, required this.title});

  final String title;

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  String _currentDay = DateFormat('EEEE').format(DateTime.now());
  String _dateNow = DateFormat('MMMM dd, yyyy').format(DateTime.now());
  int _bpm = 60;
  int _temperature = 35;

  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    const DashboardScreen(title: 'Dashboard'),
    const ViewHistoryScreen(title: 'View History'),
    const MaintenanceScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
