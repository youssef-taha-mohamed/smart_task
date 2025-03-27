import 'package:flutter/material.dart';
import 'package:smart/core/resources/icons_assets.dart';
import 'package:smart/core/styles/colors.dart';
import '../../core/resources/images_assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Container(
              alignment: Alignment.center,
              width: 40,
              height: 40,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: AppColors.grey1,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                scale: 0.9,
                IconsAssets.menu,
              ),
            ),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.center,
            width: 40,
            height: 40,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: AppColors.grey1,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  IconsAssets.notification,
                  scale: 1.1,
                ),
                Positioned(
                  top: -2,
                  right: -3,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              ImagesAssets.profile,
              width: 36,
              height: 36,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
