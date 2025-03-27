import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart/core/resources/svg_assets.dart';
import 'package:smart/core/styles/colors.dart';
import 'package:smart/share/widgets/main_text.dart';

class DropDownItemWidget extends StatelessWidget {
  const DropDownItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Search TextField
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'ابحث هنا',
                hintStyle: GoogleFonts.cairo(
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      SvgAssets.sale,
                      width: 20,
                      height: 20,
                    ),
                    Icon(Icons.keyboard_arrow_up)
                  ],
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              ),
            ),
          ),
          // Dropdown List
          Container(
            constraints: BoxConstraints(
              maxHeight: 300, // Adjust this value as needed
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: 12,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                  ),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                    title: Row(
                      children: [
                        MainText(
                          '150',
                          fontSize: 10,
                        ),
                        SizedBox(width: 12),
                        MainText(
                          'MOHD طابعة ملصقات',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        Spacer(),
                        MainText(
                          '450.000 د.ج',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    onTap: () {
                      // Handle item selection
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
