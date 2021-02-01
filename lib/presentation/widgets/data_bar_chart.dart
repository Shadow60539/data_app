import 'dart:math';

import 'package:data_app/core/colors.dart';
import 'package:data_app/presentation/widgets/sub_arc_painter.dart';
import 'package:data_app/presentation/widgets/white_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';

import 'fade_animations.dart';
import 'big_arc_painter.dart';
import 'gear_painter.dart';

class DataPieChart extends StatelessWidget {
  const DataPieChart({
    Key key,
    @required AnimationController startController,
    @required AnimationController endController,
    @required AnimationController dialController,
    @required AnimationController arcController,
  })  : _startController = startController,
        _endController = endController,
        _dialController = dialController,
        _arcController = arcController,
        super(key: key);

  final AnimationController _startController;
  final AnimationController _endController;
  final AnimationController _dialController;
  final AnimationController _arcController;

  @override
  Widget build(BuildContext context) {
    return FadeFromUpAnimation(
      begin: 0.3,
      end: 0.6,
      drop: 0.04,
      up: 0.02,
      startController: _startController,
      endController: _endController,
      child: Neumorphic(
        boxShape: const NeumorphicBoxShape.circle(),
        style: NeumorphicStyle(
            color: kSwatch2,
            depth: Neumorphic.MAX_DEPTH,
            lightSource: LightSource.topLeft,
            shadowLightColor: Colors.white,
            shadowDarkColor: kSwatch5.withOpacity(0.7),
            shape: NeumorphicShape.concave),
        child: AspectRatio(
          aspectRatio: 1.25,
          child: SizedBox(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: _dialController,
                  builder: (context, child) {
                    return FadeTransition(
                      opacity: CurvedAnimation(
                          parent: _arcController,
                          curve: const Interval(0.0, 0.45)),
                      child: ScaleTransition(
                        scale: CurvedAnimation(
                            parent: _arcController,
                            curve: const Interval(0.0, 0.2)),
                        child: RotationTransition(
                          turns: CurvedAnimation(
                              parent: _dialController,
                              curve: Curves.fastLinearToSlowEaseIn),
                          child: child,
                        ),
                      ),
                    );
                  },
                  child: CustomPaint(
                    size: const Size.fromRadius(105),
                    isComplex: true,
                    painter: GearPainter(),
                  ),
                ),
                AnimatedBuilder(
                  animation: _arcController,
                  builder: (BuildContext context, Widget child) {
                    return FadeTransition(
                      opacity: CurvedAnimation(
                          parent: _arcController,
                          curve: const Interval(0.0, 0.45)),
                      child: ScaleTransition(
                        scale: CurvedAnimation(
                            parent: _arcController,
                            curve: const Interval(0.0, 0.3)),
                        child: CustomPaint(
                          size: const Size.fromRadius(130),
                          painter: BigArcPainter(CurvedAnimation(
                                  parent: _arcController,
                                  curve: Curves.easeInOutBack)
                              .value),
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 45,
                  right: 96,
                  height: 50,
                  width: 75,
                  child: Visibility(
                    visible: _arcController.value > 0.9,
                    child: Transform.rotate(
                      angle: 1.25 * pi,
                      child: Lottie.asset('assets/splash.json',
                          frameRate: FrameRate.max, repeat: false),
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: _arcController,
                  builder: (BuildContext context, Widget child) {
                    return FadeTransition(
                      opacity: CurvedAnimation(
                          parent: _arcController,
                          curve: const Interval(0.0, 0.45)),
                      child: ScaleTransition(
                        scale: CurvedAnimation(
                            parent: _arcController,
                            curve: const Interval(0.0, 0.4)),
                        child: CustomPaint(
                          size: const Size.fromRadius(120),
                          painter: WhitePainter(
                              radius: 120, animationController: _arcController),
                        ),
                      ),
                    );
                  },
                ),
                Neumorphic(
                  boxShape: const NeumorphicBoxShape.circle(),
                  style: const NeumorphicStyle(
                      color: kSwatch2, shape: NeumorphicShape.concave),
                  // margin: const EdgeInsets.all(20),
                  child: CustomPaint(
                    size: const Size.fromRadius(45),
                    painter: SubArcPainter(),
                  ),
                ),
                Neumorphic(
                  boxShape: const NeumorphicBoxShape.circle(),
                  style: const NeumorphicStyle(
                      shadowDarkColor: Colors.white12,
                      color: kSwatch2,
                      shape: NeumorphicShape.concave),
                  // margin: const EdgeInsets.all(20),
                  child: CustomPaint(
                    size: const Size.fromRadius(38),
                    painter: SubArcPainter(),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '6.59',
                      style: TextStyle(
                          color: kSwatch4,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '/ 10Gb',
                      style: TextStyle(
                          color: kSwatch1,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
