import 'package:data_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SIMCardWidget extends StatelessWidget {
  const SIMCardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Neumorphic(
        margin: const EdgeInsets.all(8),
        style: const NeumorphicStyle(color: kSwatch2),
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
        child: SizedBox(
          height: 120,
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'SIM1 • Verizon',
                        style: TextStyle(
                            color: kSwatch4, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        '5G/4G',
                        style: TextStyle(
                            fontSize: 12,
                            color: kSwatch1,
                            fontWeight: FontWeight.normal),
                      ),
                      const Spacer(),
                      const Text(
                        '7.56/10Gb',
                        style: TextStyle(
                            fontSize: 16,
                            color: kSwatch4,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(5, 5),
                        spreadRadius: 0.5)
                  ]),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/sim.svg',
                        height: 57,
                        color: kSwatch3,
                      ),
                      SvgPicture.asset(
                        'assets/sim-card.svg',
                        height: 60,
                        color: kSwatch1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
