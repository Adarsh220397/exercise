import 'package:exercise/screens/balance_screen.dart';
import 'package:exercise/screens/pay_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: bottomNaviPage()),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.blue,
        ),
        child: BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            showUnselectedLabels: true,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            key: _scaffoldKey,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.wallet,
                  color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
                ),
                label: 'Balance',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.payments_outlined,
                  color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
                ),
                label: 'Pay',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.circleArrowUp,
                    color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
                  ),
                  label: 'Send'),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.arrowRightArrowLeft,
                    color: _selectedIndex == 3 ? Colors.blue : Colors.grey,
                  ),
                  label: 'History'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.more_horiz,
                    color: _selectedIndex == 4 ? Colors.blue : Colors.grey,
                  ),
                  label: 'More'),
            ]),
      ),
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
    PayTabScreen(), // sent screen
    PayTabScreen(), // history screen
    PayTabScreen(), // more screen
  ];
}
