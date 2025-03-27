import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

class Globals {
  static GlobalKey<NavigatorState> navigatorKey = locator();
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = locator();
  static BuildContext? globalContext = navigatorKey.currentContext;
}

void setupLocator() {

  if (!locator.isRegistered<GlobalKey<NavigatorState>>()) {
    locator.registerLazySingleton<GlobalKey<NavigatorState>>(() => GlobalKey<NavigatorState>());
  }

  if (!locator.isRegistered<GlobalKey<ScaffoldMessengerState>>()) {
    locator.registerLazySingleton<GlobalKey<ScaffoldMessengerState>>(() => GlobalKey<ScaffoldMessengerState>());
  }

  // region Cubits
}
