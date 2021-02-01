
import 'package:data_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'fade_animations.dart';

class DataHeader extends StatelessWidget {
  const DataHeader({
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
      begin: 0.2,
      end: 0.5,
      startController: _startController,
      endController: _endController,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('DATAQT14A',
              style: TextStyle(
                  color: kSwatch3, fontSize: 14, fontWeight: FontWeight.bold)),
          Neumorphic(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            boxShape: const NeumorphicBoxShape.circle(),
            style: const NeumorphicStyle(
                color: kSwatch3, shape: NeumorphicShape.concave),
            child: const SizedBox(
              height: 5,
              width: 5,
            ),
          ),
          const Text('25/30 days',
              style: TextStyle(
                  color: kSwatch3, fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}