import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DeveloperText extends StatefulWidget {

  @override
  _DeveloperTextState createState() => _DeveloperTextState();
}

class _DeveloperTextState extends State<DeveloperText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacityAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 25,
              right: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Text(
                    'Developed by : TANVI NAIK, D12C 48',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Container(
                //   child: SvgPicture.asset(
                //     'assets/icons/cart.svg',
                //     width: 20,
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}