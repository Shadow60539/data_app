import 'package:data_app/core/colors.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import 'fade_animations.dart';

class HomeDataPack extends StatelessWidget {
  const HomeDataPack({
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
      begin: 0.3,
      end: 0.6,
      startController: _startController,
      endController: _endController,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Neumorphic(
                style: NeumorphicStyle(
                    color: kSwatch1, shape: NeumorphicShape.convex),
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
                child: SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'TOP UP',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            '20% OFF',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Neumorphic(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(10)),
                        style: NeumorphicStyle(
                            depth: -10,
                            color: kSwatch1,
                            shape: NeumorphicShape.concave),
                        child: SizedBox(
                          height: 35,
                          width: 35,
                          child: Icon(
                            FontAwesomeIcons.arrowUp,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Neumorphic(
                style: NeumorphicStyle(color: kSwatch2),
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
                child: SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'PACKAGE',
                            style: TextStyle(
                                fontSize: 12,
                                color: kSwatch4,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            '+2 NEW',
                            style: TextStyle(
                                fontSize: 10,
                                color: kSwatch1,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Neumorphic(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(10)),
                        style: NeumorphicStyle(
                            depth: -10,
                            color: kSwatch2,
                            shape: NeumorphicShape.concave),
                        child: SizedBox(
                          height: 35,
                          width: 35,
                          child: Icon(
                            FontAwesomeIcons.archive,
                            color: kSwatch1,
                            size: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
