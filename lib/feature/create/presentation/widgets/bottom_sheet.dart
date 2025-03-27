import 'package:flutter/material.dart';
import 'package:smart/share/widgets/main_text.dart';

import '../../../../core/styles/colors.dart';
import '../cubit/create_fatoura_cubit.dart';

class BottomSheetWidget extends StatelessWidget {
  // final CreateFatouraCubit cubit;

  const BottomSheetWidget({super.key, });//required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
      child: Row(
        spacing: 16,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Next action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                foregroundColor: AppColors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: MainText(
                'التالي',
                fontSize: 14,
                color: AppColors.white,
              ),
            ),
          ),
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                // Cancel action
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.blue,
                side: const BorderSide(color: AppColors.blue),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: MainText(
                'إلغاء',
                fontSize: 14,
                color: AppColors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
