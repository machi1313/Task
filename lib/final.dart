import 'dart:async';
import 'package:flutter/material.dart';
import 'package:maint/Screen2.dart';
import 'package:maint/Screen3.dart';
import 'package:maint/dummy1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AllPagesInPageView extends StatefulWidget {
  @override
  _AllPagesInPageViewState createState() => _AllPagesInPageViewState();
}

class _AllPagesInPageViewState extends State<AllPagesInPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _timer?.cancel();
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background for page 0
          if (_currentPage == 0) Positioned.fill(child: Background()),

          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 3,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    switch (index) {
                      case 0:
                        return Container(); // Empty container to occupy space
                      case 1:
                        return NewScreen();
                      case 2:
                        return AnimatedWalletScreen();
                      default:
                        return Container();
                    }
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      activeDotColor: _currentPage == 0
                          ? Colors.white // White color for active dot on page 0
                          : Colors.black, // Black color for other dots
                      dotHeight: 4,
                      dotWidth: 6,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(fixedSize: Size(171, 56)),
                      onPressed: () {
                        // Handle login button press
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue, fixedSize: Size(171, 56)),
                      onPressed: () {
                        // Handle signup button press
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
