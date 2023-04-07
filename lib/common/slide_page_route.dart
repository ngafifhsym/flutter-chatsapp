import 'package:flutter/cupertino.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget child;

  SlidePageRoute({required this.child})
      : super(
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                      .animate(animation),
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );
}
