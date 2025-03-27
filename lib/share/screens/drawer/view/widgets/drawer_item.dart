import 'package:flutter/material.dart';
import '../../../../widgets/main_text.dart';

class DrawerItem extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final String? image;
  final String title;
  final void Function()? onTap;
  final Color color;

  const DrawerItem({
    this.image,
    this.leading,
    this.trailing,
    required this.title,
    required this.onTap,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          leading: leading != null
              ? Container(
                  alignment: Alignment.center,
                  width: 45,
                  height: 45,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: leading,
                )
              : Container(
                  alignment: Alignment.center,
                  width: 45,
                  height: 45,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    image!,
                    height: 20,
                    width: 20,
                    color: color,
                  ),
                ),
          title: MainText(
            title,
            fontSize: 16,
          ),
          trailing: trailing,
          onTap: onTap,
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
