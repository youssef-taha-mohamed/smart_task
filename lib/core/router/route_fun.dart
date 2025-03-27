import 'package:flutter/material.dart';
// import '../../config/route.dart';

Future<T?> routeTo<T extends Object?,TO extends Object?>(
    BuildContext context,
    String route, {
      Object? arguments,
      Function(T?)? then,
      bool isPushReplacement = false,
      bool isPushNamedAndRemoveUntil = false,
      bool isMustLogin = false,
    }) async {
  if (isPushReplacement) {
    return await Navigator.pushReplacementNamed<T, TO>(
      context,
      route,
      arguments: arguments,
    );
  } else if (isPushNamedAndRemoveUntil) {
    return await Navigator.pushNamedAndRemoveUntil<T>(
      context,
      route,
          (route) => false, // this removes all routes, navigate to the new one
      arguments: arguments,
    );
  } else {
    return await Navigator.pushNamed<T>(
      context,
      route,
      arguments: arguments,
    );
  }
}

