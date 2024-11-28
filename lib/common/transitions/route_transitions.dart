import 'package:flutter/material.dart';

PageRoute fadeInRoute(Widget route, {bool opaque = true}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => route,
    opaque: opaque,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween =
          Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.easeIn));

      return FadeTransition(
        opacity: animation.drive(tween),
        child: child,
      );
    },
  );
}

PageRoute slideInRoute(Widget route) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => route,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween =
          Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
              .chain(CurveTween(curve: Curves.easeIn));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
