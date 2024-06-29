// ignore_for_file: non_constant_identifier_names, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:traffic_sign/taps/aboutus_tap.dart';
import 'package:traffic_sign/taps/home_Tap.dart';
import 'package:traffic_sign/taps/profile_tap.dart';
import 'package:traffic_sign/taps/realtime_cam.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

int _selectedindex = 0;



class _homeScreenState extends State<homeScreen> {
  final List<Widget> _taps =  [ const homeTap(),const realtimecam(),  const aboutUsTap(),const profileTap()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
      body: _taps[_selectedindex],
      bottomNavigationBar: Container(
        color: const Color.fromRGBO(238, 238, 238, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
              onTabChange: (newindex) {
                setState(() {
                  _selectedindex = newindex;
                });
              },
              backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
              color: const Color.fromRGBO(0, 0, 0, 1),
              activeColor: Colors.white,
              tabBackgroundColor: Colors.blue,
              padding: const EdgeInsets.all(10),
              gap: 8,
              iconSize: 30,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              tabs:  const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.camera_alt_outlined,
                  text: 'Real Time'),
                GButton(
                  icon: Icons.groups_2_outlined,
                  text: 'About Us',
                ),
                GButton(
                  icon: Icons.group_outlined,
                  text: 'Profile',
                ),
              ]),
        ),
      ),
    );
  }
}
