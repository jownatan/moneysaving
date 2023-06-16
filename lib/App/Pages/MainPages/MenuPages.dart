import 'dart:ui';
import 'package:akar_icons_flutter/akar_icons_flutter.dart';

import 'HomePage.dart';

import 'package:flutter/material.dart';

class MenuPages extends StatefulWidget {
  @override
  _MenuPagesState createState() => _MenuPagesState();
}

class _MenuPagesState extends State<MenuPages> {
  int _currentIndex = 0;
  final List<Widget> _pages = [HomePage()];
  final PageController _pageController = PageController(initialPage: 0);

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return _pages[index];
            },
            onPageChanged: _onPageChanged,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              child: Container(
                height: 100,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(
                          _currentIndex == 0
                              ? AkarIcons.home
                              : AkarIcons.home_alt1,
                          size: 25,
                        ),
                        onPressed: () {
                          _pageController.jumpToPage(0);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          _currentIndex == 1
                              ? AkarIcons.chat_bubble
                              : AkarIcons.chat_dots,
                          size: 25,
                        ),
                        onPressed: () {
                          _pageController.jumpToPage(1);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
