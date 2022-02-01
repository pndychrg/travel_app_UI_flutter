import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigationBarTravel extends StatefulWidget {
  @override
  _BottomNavigationBarTravelState createState() =>
      _BottomNavigationBarTravelState();
}

class _BottomNavigationBarTravelState extends State<BottomNavigationBarTravel> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var bottomNavStyle =
      GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86.4,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 15,
            offset: Offset(0, 5))
      ]),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? Icon(
                    Icons.home,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? Icon(
                    Icons.thumb_up,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.thumb_up_alt_outlined,
                    color: Colors.black,
                  ),
            label: 'Heart',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? Icon(
                    Icons.clear_rounded,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
            label: 'Plus',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? Icon(
                    Icons.notifications_active,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 4
                ? Icon(
                    Icons.account_circle,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.account_circle_outlined,
                    color: Colors.black,
                  ),
            label: 'User',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
      ),
    );
  }
}
