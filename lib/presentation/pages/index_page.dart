import 'package:data_app/core/colors.dart';
import 'package:data_app/core/strings.dart';
import 'package:data_app/presentation/pages/data_details_page.dart';
import 'package:data_app/presentation/pages/home_page.dart';
import 'package:data_app/presentation/widgets/nav_item_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with TickerProviderStateMixin {
  final ValueNotifier<int> _indexNotifier = ValueNotifier<int>(0);
  AnimationController _homeStartController;
  AnimationController _homeEndController;
  AnimationController _dataStartController;
  AnimationController _dataEndController;
  AnimationController _arcController;
  AnimationController _dialController;

  @override
  void initState() {
    _initializeAnimationControllers();
    super.initState();
  }

  @override
  void dispose() {
    _disposeAnimationControllers();
    super.dispose();
  }

  void _initializeAnimationControllers() {
    _arcController = AnimationController(
        vsync: this, duration: kAnimationDuration, lowerBound: 0.1);
    _homeStartController = AnimationController(
      vsync: this,
      duration: kAnimationDuration,
    )..forward();
    _homeEndController = AnimationController(
      vsync: this,
      duration: kAnimationDuration,
    );
    _dataStartController = AnimationController(
      vsync: this,
      duration: kAnimationDuration,
    );
    _dataEndController = AnimationController(
      vsync: this,
      duration: kAnimationDuration,
    );
    _dialController = AnimationController(
        vsync: this, duration: const Duration(seconds: 2), lowerBound: 0.1);
  }

  void _disposeAnimationControllers() {
    _arcController.dispose();
    _homeStartController.dispose();
    _homeEndController.dispose();
    _dataStartController.dispose();
    _dataEndController.dispose();
    _dialController.dispose();
  }

  void navigateToHome() {
    _homeEndController.forward();
    Future.delayed(const Duration(milliseconds: 850)).whenComplete(() {
      _dataStartController.forward();
      _indexNotifier.value = 1;
      _homeEndController.reset();
      _arcController.forward();
      Future.delayed(const Duration(milliseconds: 850)).whenComplete(() {
        _dialController.forward();
      });
      _homeStartController.reset();
    });
  }

  void navigateToDataDetailsPage() {
    _arcController.reverse();
    _dialController.reverse();
    _dataEndController.forward();
    Future.delayed(const Duration(milliseconds: 850)).whenComplete(() {
      _homeEndController.reset();
      _homeStartController.forward();

      _indexNotifier.value = 0;
      _dataEndController.reset();
      _dataStartController.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _homeStartController,
          _homeEndController,
          _dataStartController,
          _dataEndController,
          _indexNotifier
        ]),
        builder: (BuildContext context, Widget child) => Scaffold(
          body: IndexedStack(
            index: _indexNotifier.value,
            children: [
              HomePage(
                endController: _homeEndController,
                startController: _homeStartController,
              ),
              DataDetailsPage(
                arcController: _arcController,
                dialController: _dialController,
                startController: _dataStartController,
                endController: _dataEndController,
              )
            ],
          ),
          bottomNavigationBar: Neumorphic(
            style: const NeumorphicStyle(color: kSwatch2),
            child: SizedBox(
              height: 90,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavigationBarItem(
                    isAnimating: _dataEndController.isAnimating,
                    onPressed: navigateToDataDetailsPage,
                    depth: _indexNotifier.value == 0
                        ? -10 * _homeStartController.value
                        : 4 * _dataStartController.value,
                    child: Lottie.asset(
                      'assets/home.json',
                      repeat: false,
                      height: _indexNotifier.value == 1 ? 16 : 20,
                      width: _indexNotifier.value == 1 ? 16 : 20,
                    ),
                  ),
                  NavigationBarItem(
                    isAnimating: _homeEndController.isAnimating,
                    onPressed: navigateToHome,
                    depth: _indexNotifier.value == 1
                        ? -10 * _dataStartController.value
                        : 4 * _homeStartController.value,
                    child: Icon(
                      FontAwesomeIcons.signal,
                      color: _indexNotifier.value == 0 ? kSwatch3 : kSwatch5,
                      size: _indexNotifier.value == 0 ? 16 : 20,
                    ),
                  ),
                  const NavigationBarItem(
                    isAnimating: false,
                    onPressed: null,
                    depth: 4,
                    child: Icon(
                      FontAwesomeIcons.userAlt,
                      color: kSwatch3,
                      size: 16,
                    ),
                  ),
                  const NavigationBarItem(
                    isAnimating: false,
                    onPressed: null,
                    depth: 4,
                    child: Icon(
                      FontAwesomeIcons.cog,
                      color: kSwatch3,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
