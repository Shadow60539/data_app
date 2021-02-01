import 'dart:math';

import 'package:data_app/core/colors.dart';
import 'package:data_app/presentation/widgets/data_appbar.dart';
import 'package:data_app/presentation/widgets/data_bar_chart.dart';
import 'package:data_app/presentation/widgets/data_filter.dart';
import 'package:data_app/presentation/widgets/data_header.dart';
import 'package:data_app/presentation/widgets/data_statistics.dart';
import 'package:data_app/presentation/widgets/data_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DataDetailsPage extends StatefulWidget {
  final AnimationController arcController;
  final AnimationController dialController;
  final AnimationController startController;
  final AnimationController endController;

  const DataDetailsPage(
      {Key key,
      this.arcController,
      this.dialController,
      this.startController,
      this.endController})
      : super(key: key);
  @override
  _DataDetailsPageState createState() =>
      // ignore: no_logic_in_create_state
      _DataDetailsPageState(startController, endController);
}

class _DataDetailsPageState extends State<DataDetailsPage>
    with SingleTickerProviderStateMixin {
  _DataDetailsPageState(this._startController, this._endController);
  AnimationController _barController;
  final AnimationController _startController;
  final AnimationController _endController;

  final List<double> _chartValues =
      List.generate(7, (index) => Random().nextDouble() * 70);

  final ValueNotifier<int> _indexNotifier = ValueNotifier<int>(2);

  @override
  void initState() {
    _barController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 400),
        lowerBound: 0.5)
      ..forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSwatch2,
        body: AnimatedBuilder(
          animation: Listenable.merge([_startController, _endController]),
          builder: (context, child) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  DataAppBar(
                      startController: _startController,
                      endController: _endController),
                  const SizedBox(
                    height: 20,
                  ),
                  DataTitle(
                      startController: _startController,
                      endController: _endController),
                  const SizedBox(
                    height: 12,
                  ),
                  DataHeader(
                      startController: _startController,
                      endController: _endController),
                  const SizedBox(
                    height: 40,
                  ),
                  DataPieChart(
                    startController: _startController,
                    endController: _endController,
                    arcController: widget.arcController,
                    dialController: widget.dialController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DataFilterWidget(
                      startController: _startController,
                      endController: _endController),
                  const SizedBox(
                    height: 10,
                  ),
                  DataStatistics(
                    indexNotifier: _indexNotifier,
                    barController: _barController,
                    arcController: widget.arcController,
                    chartValues: _chartValues,
                  ),
                ],
              ),
            );
          },
        ));
  }
}
