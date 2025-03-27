import 'package:flutter/material.dart';
import 'package:smart/core/styles/colors.dart';
import '../../../../share/screens/drawer/view/drawer_view.dart';
import '../../../../share/widgets/main_text.dart';
import '../../data/model/statistic_model.dart';
import '../../../../share/widgets/app_bar.dart';
import 'widgets/carousel_section.dart';
import 'widgets/statics_widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: AppColors.white, // Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Top header with logo and menu
                CustomAppBar(),
                // Main card - horizontal scrollable
                CarouselSection(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                  child: Column(
                    children: [
                      _buildShowAll(title: 'الأكثر مبيعاً'),
                      _buildCard(
                        child: Column(
                          children: bestSellerList.map((item) {
                            return StaticsWidgets(static: item);
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                  child: Column(
                    children: [
                      _buildShowAll(
                        title: 'الفواتير السابقة',
                      ),
                      _buildCard(
                        child: Column(
                          children: lastFatouraList.map((item) {
                            return StaticsWidgets(
                              static: item,
                              isMore: false,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                  child: Column(
                    children: [
                      _buildShowAll(
                        title: 'عرض الجميع',
                      ),
                      // Rounded container for receipts
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 32, horizontal: 16),
                        margin: const EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border(
                            top: BorderSide(
                              color: AppColors.primarySecondColor,
                              width: 5,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.grey300,
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            spacing: 16,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MainText(
                                'لا يوجد سندات!',
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              Icon(
                                Icons.receipt_long_outlined,
                                color: Colors.blue.shade200,
                                size: 60,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Add spacing at the bottom for the navigation bar
                const SizedBox(height: 72),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShowAll({required String title}) {
    return Row(
      children: [
        MainText(
          title,
          fontSize: 18,
        ),
        const Spacer(),
        MainText(
          'عرض الجميع',
          color: AppColors.grey30,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ],
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border(
          top: BorderSide(
            color: AppColors.primarySecondColor,
            width: 5,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey300,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
