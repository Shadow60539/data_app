import 'package:data_app/core/colors.dart';
import 'package:flutter/material.dart';

import 'fade_animations.dart';

class DataTitle extends StatelessWidget {
  const DataTitle({
    Key key,
    @required AnimationController startController,
    @required AnimationController endController,
  })  : _startController = startController,
        _endController = endController,
        super(key: key);

  final AnimationController _startController;
  final AnimationController _endController;

  @override
  Widget build(BuildContext context) {
    return FadeFromUpAnimation(
      begin: 0.1,
      end: 0.4,
      startController: _startController,
      endController: _endController,
      child: const Center(
          child: Text('Data usage',
              style: TextStyle(
                  color: kSwatch5,
                  shadows: [
                    Shadow(color: kSwatch3, blurRadius: 3, offset: Offset(2, 2))
                  ],
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.2))),
    );
  }
}
