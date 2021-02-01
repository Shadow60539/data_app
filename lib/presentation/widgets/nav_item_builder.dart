import 'package:data_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    Key key,
    @required Widget child,
    @required VoidCallback onPressed,
    @required double depth,
    @required bool isAnimating,
  })  : _onPressed = onPressed,
        _child = child,
        _depth = depth,
        _isAnimating = isAnimating,
        super(key: key);

  final VoidCallback _onPressed;
  final Widget _child;
  final double _depth;
  final bool _isAnimating;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Neumorphic(
            style: NeumorphicStyle(
              color: kSwatch2,
              depth: _depth,
              shape: NeumorphicShape.convex,
            ),
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
            padding: const EdgeInsets.all(15),
            child: _child,
          ),
          Lottie.asset(
            'assets/touch.json',
            animate: _isAnimating,
            repeat: false,
            height: 100,
            width: 100,
          )
        ],
      ),
    );
  }
}