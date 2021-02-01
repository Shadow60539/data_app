import 'package:data_app/core/colors.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'fade_animations.dart';

class DataFilterWidget extends StatelessWidget {
  const DataFilterWidget({
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
      begin: 0.4,
      end: 1.0,
      startController: _startController,
      endController: _endController,
      child: Row(
        children: [
          const Text(
            '3.41GB USED',
            style: TextStyle(
                color: kSwatch5, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Spacer(),
          Neumorphic(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
            style: const NeumorphicStyle(
                color: kSwatch2, shape: NeumorphicShape.concave),
            child: SizedBox(
              height: 30,
              width: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Feb 1-7',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: kSwatch4),
                  ),
                  const Icon(
                    FontAwesomeIcons.caretDown,
                    color: kSwatch1,
                    size: 18,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
