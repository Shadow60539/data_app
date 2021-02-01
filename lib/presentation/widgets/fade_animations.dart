import 'package:flutter/material.dart';

const kCurve = Curves.easeInCubic;

class FadeFromUpAnimation extends StatefulWidget {
  final Widget child;
  final double begin, end;
  final double drop;
  final double up;
  final AnimationController startController;
  final AnimationController endController;

  const FadeFromUpAnimation(
      {this.child,
      this.begin,
      this.end,
      this.drop = 0.3,
      this.up = 0.3,
      this.startController,
      this.endController});
  @override
  _FadeFromUpAnimationState createState() => _FadeFromUpAnimationState();
}

class _FadeFromUpAnimationState extends State<FadeFromUpAnimation>
    with SingleTickerProviderStateMixin {
  Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.endController.status == AnimationStatus.forward) {
      _animation =
          Tween<Offset>(begin: Offset.zero, end: Offset(0, -widget.up)).animate(
        CurvedAnimation(
            parent: widget.endController,
            curve: Interval(widget.begin, widget.end, curve: kCurve)),
      );
    } else {
      _animation =
          Tween<Offset>(begin: Offset(0, widget.drop), end: Offset.zero)
              .animate(
        CurvedAnimation(
            parent: widget.startController,
            curve: Interval(widget.begin, widget.end, curve: kCurve)),
      );
    }

    AnimationController _currentController() {
      switch (widget.endController.status == AnimationStatus.forward) {
        case true:
          return widget.endController;

          break;
        default:
          return widget.startController;
      }
    }

    return SlideTransition(
        position: _animation,
        child: Opacity(
          opacity: Tween(begin: 0.0, end: 1.0)
              .animate(CurvedAnimation(
                  parent: widget.startController,
                  curve: Curves.easeOut))
              .value,
          child: widget.child,
        ));
  }
}
