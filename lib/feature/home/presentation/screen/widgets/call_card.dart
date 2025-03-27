import 'package:flutter/material.dart';
import '../../../../../core/resources/icons_assets.dart';
import '../../../../../share/widgets/main_text.dart';

class CallToActionCard extends StatelessWidget {
  const CallToActionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Image.asset(
              IconsAssets.smart,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainText(
                  'دعونا نكن معاً!',
                  color: Colors.white,
                ),
                MainText(
                  'أخبرونا كيف يمكن أن نجعل ذكي أفضل',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                  fontSize: 12,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  height: 26,
                  width: 121,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MainText(
                        'أرسل إلينا ملاحظاتك',
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                      const Icon(
                        Icons.message_outlined,
                        color: Colors.blue,
                        size: 20,
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
