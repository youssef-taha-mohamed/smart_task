import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/dependency_injection/dependency_injection.dart';
import '../core/router/router.dart';
import '../feature/layout/presentation/screens/layout_screen.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class SmartApp extends StatelessWidget {
  const SmartApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    setupLocator();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<GlobalKey<NavigatorState>>(),
      navigatorObservers: [routeObserver],
      title: 'تطبيق دكي',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: 'Tajawal',
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      locale: const Locale('ar'),
      onGenerateRoute: Routes().onGenerateRoute,
      home: const LayoutScreen(),
      builder: (context, child) {
        return Builder(builder: (context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        });
      },
    );
  }
}