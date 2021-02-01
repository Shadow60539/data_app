import 'package:data_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'fade_animations.dart';

class DataAppBar extends StatelessWidget {
  const DataAppBar({
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
      begin: 0.0,
      end: 0.3,
      startController: _startController,
      endController: _endController,
      child: Row(
        children: [
          const Text(
            'Data details',
            style: TextStyle(
                color: kSwatch5, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Spacer(),
          LimitedBox(
            maxHeight: 25,
            maxWidth: 25,
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                  4,
                  (index) => Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: Neumorphic(
                          boxShape: const NeumorphicBoxShape.circle(),
                          style: const NeumorphicStyle(
                              color: kSwatch3, shape: NeumorphicShape.convex),
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
