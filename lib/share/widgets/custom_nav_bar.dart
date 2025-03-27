import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart/core/resources/svg_assets.dart';
import 'package:smart/core/styles/colors.dart';

class MobileBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MobileBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey400,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(
              index: 4,
              isActive: currentIndex == 4,
              svgPath: SvgAssets.home,
            ),
            _buildNavItem(
              svgPath: SvgAssets.scanner,
              index: 3,
              isActive: currentIndex == 3,
            ),
            _buildAddButton(),
            _buildNavItem(
              svgPath: SvgAssets.sale,
              index: 1,
              isActive: currentIndex == 1,
            ),
            _buildNavItem(
              svgPath: SvgAssets.person,
              index: 0,
              isActive: currentIndex == 0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    String? svgPath,
    required int index,
    required bool isActive,
  }) {
    return InkWell(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgPath!,
            colorFilter: ColorFilter.mode(
              isActive ? AppColors.blue : AppColors.grey,
              BlendMode.srcIn,
            ),
            width: 28,
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return InkWell(
      onTap: () => onTap(2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            decoration:
                BoxDecoration(color: AppColors.blue, shape: BoxShape.circle),
            child: const Icon(
              Icons.add,
              color: AppColors.white,
              size: 27,
            ),
          ),
        ],
      ),
    );
  }
}
