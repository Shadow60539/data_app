import 'package:data_app/core/colors.dart';
import 'package:data_app/presentation/widgets/fade_animations.dart';
import 'package:data_app/presentation/widgets/home_appbar.dart';
import 'package:data_app/presentation/widgets/home_datapack.dart';
import 'package:data_app/presentation/widgets/home_header.dart';
import 'package:data_app/presentation/widgets/sim_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.startController, this.endController})
      : super(key: key);
  final AnimationController startController;
  final AnimationController endController;

  @override
  _HomePageState createState() =>
      // ignore: no_logic_in_create_state
      _HomePageState(startController, endController);
}

class _HomePageState extends State<HomePage> {
  _HomePageState(this._startController, this._endController);
  final AnimationController _startController;
  final AnimationController _endController;
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  final List<SIMCardWidget> _simLists =
      List.generate(2, (index) => const SIMCardWidget());
  final List<Widget> _animationList = [];

  @override
  void initState() {
    _addSIMCardsToList();
    super.initState();
  }

  void _addSIMCardsToList() {
    Future.delayed(const Duration(milliseconds: 700)).whenComplete(() {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        Future f = Future(() {});
        _simLists.forEach((element) {
          f = f.then(
              (value) => Future.delayed(const Duration(milliseconds: 100), () {
                    _animationList.add(element);
                    _key.currentState.insertItem(_animationList.length - 1);
                  }));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSwatch2,
        body: AnimatedBuilder(
          animation: Listenable.merge([_startController, _endController]),
          builder: (context, child) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20)
                  .copyWith(top: 20, bottom: 50),
              child: Column(
                children: [
                  HomeAppBar(
                      startController: _startController,
                      endController: _endController),
                  const SizedBox(
                    height: 20,
                  ),
                  HomeHeader(
                      startController: _startController,
                      endController: _endController),
                  const SizedBox(
                    height: 40,
                  ),
                  HomeDataPack(
                      startController: _startController,
                      endController: _endController),
                  const SizedBox(
                    height: 50,
                  ),
                  FadeFromUpAnimation(
                    begin: 0.4,
                    end: 0.7,
                    startController: _startController,
                    endController: _endController,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'SIM card managers',
                        style: TextStyle(
                            color: kSwatch5, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeFromUpAnimation(
                    begin: 0.5,
                    end: 0.8,
                    drop: 0.01,
                    // up: 0.02,
                    startController: _startController,
                    endController: _endController,
                    child: AnimatedList(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        key: _key,
                        initialItemCount: _animationList.length,
                        itemBuilder: (context, index, animation) =>
                            FadeTransition(
                              opacity: animation,
                              child: SlideTransition(
                                position: Tween(
                                        begin: Offset(0, 0.1), end: Offset.zero)
                                    .animate(animation),
                                child: const SIMCardWidget(),
                              ),
                            )),
                  )
                ],
              ),
            );
          },
        ));
  }
}
