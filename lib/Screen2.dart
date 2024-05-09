import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animationLeft1;
  late Animation<Offset> _animationLeft2;
  late Animation<Offset> _animationLeft3;
  late Animation<Offset> _animationRight1;
  late Animation<Offset> _animationRight2;
  late Animation<Offset> _animationRight3;
  late Animation<double> _textScaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animationLeft1 = Tween<Offset>(
      begin: const Offset(0.4, 0.0),
      end: const Offset(-0.1, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );
    _animationLeft2 = Tween<Offset>(
      begin: const Offset(0.4, 0.0),
      end: const Offset(-0.1, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );
    _animationLeft3 = Tween<Offset>(
      begin: const Offset(0.4, 0.0),
      end: const Offset(-0.1, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );
    _animationRight1 = Tween<Offset>(
      begin: const Offset(-0.2, 0.0),
      end: const Offset(0.1, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );
    _animationRight2 = Tween<Offset>(
      begin: const Offset(-0.2, 0.0),
      end: const Offset(0.1, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );
    _animationRight3 = Tween<Offset>(
      begin: const Offset(-0.2, 0.0),
      end: const Offset(0.1, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _textScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.7, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 300),
            child: Container(
              child: Image.asset("images/Logo1.png"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SlideTransition(
                    position: _animationLeft1,
                    child: Image.asset("images/one.png"),
                  ),
                  SlideTransition(
                    position: _animationLeft2,
                    child: Image.asset("images/two.png"),
                  ),
                  SlideTransition(
                    position: _animationLeft3,
                    child: Image.asset("images/three.png"),
                  ),
                ],
              ),
              Image.asset(
                "images/phone.png",
              ), // Central image
              Column(
                children: [
                  SlideTransition(
                    position: _animationRight1,
                    child: Image.asset("images/four.png"),
                  ),
                  SlideTransition(
                    position: _animationRight2,
                    child: Image.asset("images/five.png"),
                  ),
                  SlideTransition(
                    position: _animationRight3,
                    child: Image.asset("images/six.png"),
                  ),
                ],
              ),
            ],
          ),
          // Wrap the text with ScaleTransition to apply scaling animation
          ScaleTransition(
            scale: _textScaleAnimation,
            child: Column(
              children: [
                Text(
                  "IT'S MORE",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                Text(
                  "THAN MONEY",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ],
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.symmetric(vertical: 20),
          //   width: MediaQuery.of(context).size.width * .9,
          //   height: 55,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(8),
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       ElevatedButton(
          //         onPressed: () {
          //           // Handle login button press
          //         },
          //         child: Text(
          //           'Login',
          //           style: TextStyle(color: Colors.black, fontSize: 18),
          //         ),
          //       ),
          //       ElevatedButton(
          //         style: ElevatedButton.styleFrom(primary: Colors.blue),
          //         onPressed: () {
          //           // Handle signup button press
          //         },
          //         child: Text(
          //           'Signup',
          //           style: TextStyle(color: Colors.white, fontSize: 18),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
