import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/core/resources/icons_assets.dart';
import '../../../../core/resources/svg_assets.dart';
import '../../../../core/styles/colors.dart';
import '../../../widgets/main_text.dart';
import 'widgets/drawer_item.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isSellingPointExpanded = false;
  int? selectedPoint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(0),
          topEnd: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: MediaQuery.of(context).size.width * 0.75,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Center(
                  child: Image.asset(
                    IconsAssets.smart,
                    width: 106,
                    height: 52,
                    color: AppColors.blue,
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 60),
                    children: [
                      DrawerItem(
                        title: 'الصفحه الرئيسية',
                        onTap: () {
                          Navigator.pop(context);
                        },
                        leading: SvgPicture.asset(SvgAssets.home),
                        color: AppColors.blue,
                      ),
                      DrawerItem(
                        title: 'المخازن',
                        onTap: () {
                          Navigator.pop(context);
                        },
                        image: IconsAssets.store,
                        color: AppColors.red,
                      ),
                      DrawerItem(
                        title: 'الحسابات',
                        onTap: () {
                          Navigator.pop(context);
                        },
                        color: AppColors.green,
                        leading: Icon(
                          Icons.person,
                          color: AppColors.green,
                        ),
                      ),
                      DrawerItem(
                        title: 'المشتريات',
                        onTap: () {
                          Navigator.pop(context);
                        },
                        color: AppColors.yellow,
                        leading: Icon(
                          Icons.shopping_cart,
                          color: AppColors.yellow,
                        ),
                      ),
                      DrawerItem(
                        title: 'المبيعات',
                        onTap: () {
                          Navigator.pop(context);
                        },
                        color: AppColors.blue,
                        leading: Icon(
                          Icons.sell,
                          color: AppColors.blue,
                        ),
                      ),
                      DrawerItem(
                        title: 'المرتجعات',
                        onTap: () {
                          Navigator.pop(context);
                        },
                        color: AppColors.red,
                        leading: Icon(
                          Icons.shopping_cart,
                          color: AppColors.red,
                        ),
                      ),
                      DrawerItem(
                        title: 'الديون',
                        onTap: () {
                          Navigator.pop(context);
                        },
                        color: AppColors.green,
                        leading: Icon(
                          Icons.monetization_on_outlined,
                          color: AppColors.green,
                        ),
                      ),
                      // Selling Point as an ExpansionTile that looks like DrawerItem
                      Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                        ),
                        child: ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          childrenPadding:
                              const EdgeInsetsDirectional.only(start: 16),
                          onExpansionChanged: (expanded) {
                            setState(() {
                              isSellingPointExpanded = expanded;
                            });
                          },
                          trailing: const SizedBox.shrink(),
                          // Remove default arrow
                          title: Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 45,
                                  height: 45,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    color: AppColors.yellow.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SvgPicture.asset(
                                    SvgAssets.scanner,
                                    color: AppColors.yellow,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: MainText(
                                    'نقطة بيع',
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Icon(
                                  isSellingPointExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          children: [
                            RadioListTile<int>(
                              title: MainText('نقطة بيع 1', fontSize: 14),
                              value: 1,
                              groupValue: selectedPoint,
                              contentPadding: EdgeInsets.symmetric(horizontal: 16),
                              visualDensity: VisualDensity.compact,
                              onChanged: (value) {
                                setState(() {
                                  selectedPoint = value;
                                });
                              },
                            ),
                            RadioListTile<int>(
                              title: MainText('نقطة بيع 2', fontSize: 14),
                              value: 2,
                              visualDensity: VisualDensity.compact,
                              contentPadding: EdgeInsets.symmetric(horizontal: 16),
                              secondary: Container(
                                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: AppColors.blue,
                                ),
                                child: MainText(
                                  'مدفوع',
                                  color: AppColors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              groupValue: selectedPoint,
                              onChanged: (value) {
                                setState(() {
                                  selectedPoint = value;
                                });
                              },
                            ),
                            RadioListTile<int>(
                              title: MainText('نقطة بيع 3', fontSize: 14),
                              value: 3,
                              visualDensity: VisualDensity.compact,
                              groupValue: selectedPoint,
                              contentPadding: EdgeInsets.symmetric(horizontal: 16),
                              secondary: Container(
                                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: AppColors.blue,
                                ),
                                child: MainText(
                                  'مدفوع',
                                  color: AppColors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  selectedPoint = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      DrawerItem(
                        title: 'الصندوق',
                        onTap: () {
                          Navigator.pop(context);
                        },
                        color: AppColors.green,
                        leading: Image.asset(IconsAssets.safe),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
