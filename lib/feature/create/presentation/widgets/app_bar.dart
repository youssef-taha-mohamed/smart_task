import 'package:flutter/material.dart';
import 'package:smart/core/resources/icons_assets.dart';
import 'package:smart/core/styles/colors.dart';

class CreateAppBar extends StatelessWidget {
  const CreateAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: EdgeInsets.only(right: 8),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.grey1,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black54,
                size: 24,
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
        ],
      ),
    );
  }
}
