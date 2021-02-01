import 'package:data_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'bar_painter.dart';

class DataStatistics extends StatelessWidget {
  const DataStatistics({
    Key key,
    @required ValueNotifier<int> indexNotifier,
    @required AnimationController barController,
    @required AnimationController arcController,
    @required List<double> chartValues,
  })  : _indexNotifier = indexNotifier,
        _barController = barController,
        _chartValues = chartValues,
        _arcController = arcController,
        super(key: key);

  final ValueNotifier<int> _indexNotifier;
  final AnimationController _barController;
  final AnimationController _arcController;
  final List<double> _chartValues;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _indexNotifier,
      builder: (BuildContext context, dynamic selectedIndex, Widget child) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              return InkWell(
                onTap: () {
                  _barController.reverse();
                  Future.delayed(const Duration(milliseconds: 400))
                      .whenComplete(() {
                    _indexNotifier.value = index;
                    _barController.forward();
                  });
                },
                child: AnimatedBuilder(
                  animation: Listenable.merge([_arcController, _barController]),
                  builder: (BuildContext context, Widget child) {
                    return Neumorphic(
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(5)),
                      style: NeumorphicStyle(
                          disableDepth: selectedIndex != index,
                          shadowDarkColorEmboss: kSwatch2,
                          color: kSwatch2),
                      child: SizedBox(
                        height: selectedIndex != index
                            ? 150
                            : 150 *
                                CurvedAnimation(
                                        parent: _barController,
                                        curve: Curves.ease)
                                    .value,
                        width: selectedIndex == index ? 50 : 20,
                        child: CustomPaint(
                          size: const Size.fromHeight(150),
                          painter: ChartPainter(
                            end: _chartValues[index],
                            isSelected: selectedIndex == index,
                            value: _arcController.value,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedIndex == index
                                      ? '${(_chartValues[index] * 5).toInt()}Mb'
                                      : '',
                                  style: const TextStyle(
                                      fontSize: 11,
                                      color: kSwatch1,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '2/${index + 1}',
                                  style: const TextStyle(
                                      fontSize: 11,
                                      color: kSwatch1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }));
      },
    );
  }
}
