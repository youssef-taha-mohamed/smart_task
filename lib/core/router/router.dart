import 'package:flutter/material.dart';
import 'package:smart/feature/home/presentation/screen/dashboard_screen.dart';
import '../../feature/create/presentation/create.dart';
import '../../feature/layout/presentation/screens/layout_screen.dart';

class Routes {
  static final RouteObserver<ModalRoute<void>> routeObserver =
      RouteObserver<ModalRoute<void>>();

  // region Layout
  static const String layout = 'layout';
  static const String create = 'create';
  static const String dashboardScreen = 'dashboardScreen';

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case layout:
        return MaterialPageRoute(
          builder: (_) => LayoutScreen(),
        );
      case create:
        return MaterialPageRoute(
          builder: (_) => AddFatoura(),
        );
      case dashboardScreen:
        return MaterialPageRoute(
          builder: (_) => DashboardScreen(),
        );
    }

    return MaterialPageRoute(
      builder: (_) => const LayoutScreen(),
    );
  }
}
