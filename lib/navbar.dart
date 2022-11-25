import 'package:flutter/material.dart';
import 'package:ondwaveda/calendar.dart';
import 'package:ondwaveda/payment_list.dart';

import 'home.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});
  static String tag = 'navbar-page';
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.event),
            label: 'Eventos',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.account_balance),
            label: 'Pagamentos\nPendentes',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          color: Colors.blueGrey,
          alignment: Alignment.center,
          child: HomeScreen(),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: CalendarScreen(),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: PaymentList(),
        ),
      ][currentPageIndex],
    );
  }
}
