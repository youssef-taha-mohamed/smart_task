import 'package:flutter/material.dart';
import 'package:smart/core/styles/colors.dart';
import 'package:smart/share/widgets/main_text.dart';
import '../../../data/model/statistic_model.dart';

// ignore: must_be_immutable
class StaticsWidgets extends StatelessWidget {
  final StatisticModel static;
  bool isMore;

   StaticsWidgets({super.key, required this.static, this.isMore = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              isMore ? Icons.trending_up : Icons.receipt_long_outlined,
              color: Colors.white,
              size: 16,
            ),
          ),
          SizedBox(width: 16),
          MainText(
            static.category,
            color: AppColors.grey30,
            fontSize: 14,
          ),
          const Spacer(),
          if (static.title != null) ...[
            MainText(
              static.title!,
              color: AppColors.grey30,
              fontSize: 16,
            ),
            const Spacer(),
          ],
          MainText(
            static.quantity,
            color: AppColors.grey30,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
