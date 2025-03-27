import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../core/router/router.dart';
import '../../../home/presentation/screen/dashboard_screen.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  void init() {
    // ابدأ دائمًا بصفحة الرئيسية (آخر أيقونة في شريط التنقل)
    currentBtmNavScreenIndex = 4;
    showBottomNav = true;
    emit(ChangeBottomNavState());
  }

  static LayoutCubit get(context) => BlocProvider.of<LayoutCubit>(context);

  // تعيين القيمة الافتراضية للمؤشر الحالي على صفحة الرئيسية
  int currentBtmNavScreenIndex = 4;
  bool showBottomNav = true;

  List<Widget> get bottomNavScreens => [
    const Scaffold(body: Center(child: Text('الملف الشخصي'))), // Profile
    const Scaffold(body: Center(child: Text('المزامنة'))), // Sync
    const Scaffold(body: Center(child: Text('الإنشاء'))), // Create
    const Scaffold(body: Center(child: Text('السجلات'))), // Records
    const DashboardScreen(), // Home - الرئيسية
  ];

  void setLayoutType(bool isBusiness) {
    emit(ChangeBottomNavState());
  }

  void toggleBottomNavVisibility(bool show) {
    showBottomNav = show;
    emit(ChangeBottomNavState());
  }

  void changeBottomNavScreen({
    required int newIndex,
  }) {
    if (newIndex == 2) {
      toggleBottomNavVisibility(false);

      final navigator = Globals.navigatorKey;
      navigator.currentState?.pushNamed(Routes.create).then((_) {
        showBottomNav = true;
        emit(ChangeBottomNavState());
      });
      return;
    }

    currentBtmNavScreenIndex = newIndex;
    emit(ChangeBottomNavState());
  }

  void resetNavigation() {
    showBottomNav = true;
    currentBtmNavScreenIndex = 4; // الرئيسية
    emit(ChangeBottomNavState());
  }

  void changeLayoutToUser() {
    emit(ChangeBottomNavState());
  }

  List<Widget> getCurrentScreens() {
    return bottomNavScreens;
  }
}

extension VerificationCheck on LayoutCubit {
  void handleCrowdCreation(BuildContext context) {
    // المتابعة مع الإنشاء
    toggleBottomNavVisibility(false);
    final navigator = Globals.navigatorKey;
    navigator.currentState?.pushNamed(Routes.create).then((_) {
      showBottomNav = true;
      // عدم تغيير علامة التبويب الحالية عند العودة
      emit(ChangeBottomNavState());
    });
  }
}