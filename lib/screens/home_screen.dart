import 'package:exercise/screens/app_menu_drawer.dart';
import 'package:exercise/screens/balance_screen.dart';
import 'package:exercise/screens/pay_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    print(index);

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: bottomNaviPage()),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          //   selectedFontSize: 20,
          key: _scaffoldKey,
          selectedIconTheme: const IconThemeData(
            color: Colors.blue,
          ),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.balance,
                color: Colors.grey,
              ),
              label: 'Balance',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.payments_outlined,
                color: Colors.grey,
              ),
              label: 'Pay',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.send,
                  color: Colors.grey,
                ),
                label: 'Send'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.history,
                  color: Colors.grey,
                ),
                label: 'History'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                ),
                label: 'More'),
          ]),
    );
  }

  Widget bottomNaviPage() {
    return Row(
      children: [
        Expanded(
          child: IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
        ),
      ],
    );
  }

  static const List<Widget> _pages = <Widget>[
    BalanceScreen(),
    PayTabScreen(),
    // Camera page
    // Chats page
  ];
}
