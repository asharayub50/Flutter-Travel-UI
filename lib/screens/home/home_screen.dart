import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/screens/home/components/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/destination_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  int _currentTab = 0;
  List<IconData> icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          icons[index],
          size: 25.0,
          color: selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: 30.0),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 40),
              child: Text(
                "What would you like to find?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: icons
                  .asMap()
                  .entries
                  .map(
                    (e) => _buildIcon(e.key),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 20,
            ),
            DestinationCarousel(),
            SizedBox(
              height: 20,
            ),
            HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int val) {
          setState(() {
            _currentTab = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon: Icon(
              FontAwesomeIcons.search,
              size: 25,
            ),
          ),
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon: Icon(
              FontAwesomeIcons.pizzaSlice,
              size: 25,
            ),
          ),
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon: CircleAvatar(
              radius: 12.5,
              backgroundImage: AssetImage('assets/images/person.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
