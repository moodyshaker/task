import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task/core/providers/home_provider.dart';

import '../../core/screen_utils/screen_config.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final home = HomeProvider.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          elevation: 0.0,
          onPressed: () {
            home.setIndex(0);
          },
          backgroundColor:
              home.currentIndex == 0 ? Colors.orange : Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.home,
              color: home.currentIndex == 0 ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
      body: home.current,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          height: 54.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.settings,
                    color:
                        home.currentIndex == 1 ? Colors.orange : Colors.black),
                onPressed: () {
                  home.setIndex(1);
                },
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart_outlined,
                    color:
                        home.currentIndex == 2 ? Colors.orange : Colors.black),
                onPressed: () {
                  home.setIndex(2);
                },
              ),
              Container(),
              IconButton(
                icon: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(Icons.person_outline_rounded,
                      color: home.currentIndex == 3
                          ? Colors.orange
                          : Colors.black),
                ),
                onPressed: () {
                  home.setIndex(3);
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications_none,
                    color:
                        home.currentIndex == 4 ? Colors.orange : Colors.black),
                onPressed: () {
                  home.setIndex(4);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
