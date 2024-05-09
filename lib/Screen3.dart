import 'package:flutter/material.dart';

class AnimatedWalletScreen extends StatefulWidget {
  const AnimatedWalletScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedWalletScreen> createState() => _AnimatedWalletScreenState();
}

class _AnimatedWalletScreenState extends State<AnimatedWalletScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _imageAnimation;
  late Animation<double> _fontAnimation;
  late Animation<double> _textScaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust the duration as needed
    );
    _imageAnimation =
        Tween<double>(begin: 70.0, end: 200.0).animate(_controller);

    _textScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.9, curve: Curves.easeInOut),
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
          // Static elements outside the animation widget
          Padding(
            padding: const EdgeInsets.only(right: 300),
            child: Container(
              child: Image.asset("images/Logo1.png"),
            ),
          ),
          // Animated wallet image
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                alignment:
                    Alignment.center, // Center the container within its parent
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 50), // Animation duration
                  width: _imageAnimation.value, // Use imageSize for the width
                  height: _imageAnimation.value, // Use imageSize for the height
                  curve: Curves.easeInOut, // Use a smooth animation curve
                  child: Image.asset("images/wallet.png"),
                ),
              );
            },
          ),
          // Animated text
          ScaleTransition(
            scale: _textScaleAnimation,
            child: Column(
              children: [
                Text(
                  "SECURE LIKE",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                Text(
                  "A VAULT",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ],
            ),
          ),
          // Buttons
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
