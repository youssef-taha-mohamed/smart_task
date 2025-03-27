import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart/core/resources/svg_assets.dart';
import 'package:smart/core/styles/colors.dart';
import 'package:smart/feature/create/data/drop_down_model.dart';
import 'package:smart/share/widgets/main_text.dart';

class DropDownItemWidget extends StatelessWidget {
  final VoidCallback onTap;

  const DropDownItemWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 2),
              ),
            ]),
        child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                children: [
                  // Search TextField
                  TextField(
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
                          IconButton(
                            onPressed: onTap,
                            icon: Icon(Icons.keyboard_arrow_up),
                          ),
                        ],
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    ),
                  ),
                  // Dropdown List
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: 300, // Adjust this value as needed
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: dropDownList.length + 1,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: index == dropDownList.length
                                ? null
                                : Border(
                                    bottom: BorderSide(
                                      color: Colors.grey.withOpacity(0.1),
                                      width: 1,
                                    ),
                                  ),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 1),
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
            )));
  }
}
