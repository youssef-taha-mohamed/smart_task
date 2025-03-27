import 'package:flutter/material.dart';
import 'package:smart/core/styles/colors.dart';
import '../../../../share/widgets/main_text.dart';
import '../cubit/create_fatoura_cubit.dart';

class PriceAndQuantityWidget extends StatelessWidget {
  final FatouraItem item;

  const PriceAndQuantityWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        MainText(
          'السعر: ${item.price.toStringAsFixed(0)} د.ج',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          textDirection: TextDirection.rtl,
        ),
        Spacer(),
        _buildCircularButton(
          icon: Icons.add,
          onPressed: () {},
        ),
        // Quantity
        TextFormField(
          maxLines: 1,
          initialValue: item.quantity.toString(),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            constraints: BoxConstraints(
              maxWidth: 48,
              maxHeight: 24,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: AppColors.white,
            contentPadding: EdgeInsets.zero,
            isDense: true,
          ),
        ),
        // Minus button
        _buildCircularButton(
          icon: Icons.remove,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildCircularButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: AppColors.blue,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 18),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
