import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../../../core/styles/colors.dart';
import '../../../../share/widgets/main_text.dart';
import '../cubit/create_fatoura_cubit.dart';

class AddButtonWidget extends StatelessWidget {
  final CreateFatouraCubit cubit;

  const AddButtonWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        dashPattern: const [6, 3],
        // Adjust dot and space length as needed
        color: Colors.grey.withOpacity(0.3),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: () {
              cubit.addItem();
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MainText(
                    'إضافة مادة',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon:
                          const Icon(Icons.add, color: Colors.white, size: 22),
                      onPressed: () {
                        cubit.addItem(); // Same action as the main tap
                      },
                      padding: EdgeInsets.zero,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
