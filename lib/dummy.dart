import 'dart:async';

import 'package:flutter/material.dart';
import 'package:maint/dummy1.dart';
import 'package:maint/final.dart';

class Dummy extends StatefulWidget {
  @override
  _DummyState createState() => _DummyState();
}

class _DummyState extends State<Dummy> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _moveAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _secondTextSlideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.5),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.5, end: 1.0),
        weight: 30,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 1.0, curve: Curves.easeInOut),
      ),
    );

    _moveAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(-0.18, -0.4),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.7, 1.0, curve: Curves.easeInOut),
      ),
    );

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 1.0, curve: Curves.easeInOut),
      ),
    );

    _secondTextSlideAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.8, 0.9, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Delay navigation until after animation finishes
        Timer(Duration(milliseconds: 1), () {
          // Navigate to the PageViewScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AllPagesInPageView()),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Transform.translate(
                  offset: Offset(
                      _moveAnimation.value.dx *
                          MediaQuery.of(context).size.width,
                      _moveAnimation.value.dy *
                          MediaQuery.of(context).size.height),
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('images/logo.png',
                              width: 47.56, height: 47.56),
                          Opacity(
                            opacity: _opacityAnimation.value,
                            child: Text(
                              'Monswift',
                              style: TextStyle(
                                fontSize: 43.35,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class PageViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('PageView Screen'),
      // ),
      body: Background(),
    );
  }
}
