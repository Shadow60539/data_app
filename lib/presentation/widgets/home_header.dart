
import 'package:data_app/core/colors.dart';
import 'package:flutter/material.dart';

import 'fade_animations.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
    @required AnimationController startController,
    @required AnimationController endController,
  }) : _startController = startController, _endController = endController, super(key: key);

  final AnimationController _startController;
  final AnimationController _endController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeFromUpAnimation(
          begin: 0.1,
          end: 0.4,
          startController: _startController,
          endController: _endController,
          child: const Center(
              child: Text(
            'Main balance',
            style: TextStyle(
                color: kSwatch1,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          )),
        ),
        const SizedBox(
          height: 20,
        ),
        FadeFromUpAnimation(
          begin: 0.2,
          end: 0.5,
          startController: _startController,
          endController: _endController,
          child: const Center(
            child: Text(
              '\$120.56',
              style: TextStyle(
                  color: kSwatch5,
                  shadows: [
                    Shadow(
                        color: kSwatch3,
                        blurRadius: 2,
                        offset: Offset(3, 3))
                  ],
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5),
            ),
          ),
        ),
      ],
    );
  }
}
