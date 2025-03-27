import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../share/widgets/custom_nav_bar.dart';
import '../cubit/layout_cubit.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  final _pageController = PageController(initialPage: 4);

  @override
  void initState() {
    super.initState();
    LayoutCubit.get(context).setLayoutType(true);

    LayoutCubit.get(context).currentBtmNavScreenIndex = 4;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool canPop = false;
  Timer? _resetCanPopTimer;

  void _handleNavTap(int index) {
    final layoutCubit = LayoutCubit.get(context);
    if (index == 2) {
      // زر إنشاء
      layoutCubit.handleCrowdCreation(context);
    } else {
      layoutCubit.changeBottomNavScreen(newIndex: index);
      _pageController.jumpToPage(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        final layoutCubit = LayoutCubit.get(context);
        return PopScope(
          canPop: canPop,
          onPopInvokedWithResult: (didPop, i) {
            setState(() {
              canPop = !didPop;
            });
            if (canPop) {
              _resetCanPopTimer?.cancel();
              _resetCanPopTimer = Timer(const Duration(seconds: 2), () {
                setState(() {
                  canPop = false;
                });
              });
            }
          },
          child: Scaffold(
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: layoutCubit.getCurrentScreens(),
              ),
            ),
            extendBody: true,
            bottomNavigationBar: layoutCubit.showBottomNav
                ? MobileBottomNavBar(
              currentIndex: layoutCubit.currentBtmNavScreenIndex,
              onTap: _handleNavTap,
            )
                : null,
          ),
        );
      },
    );
  }
}