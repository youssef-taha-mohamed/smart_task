import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../share/widgets/main_text.dart';
import '../../../data/model/profit_model.dart';

class ProfitCardWidget extends StatelessWidget {
  final ProfitModel profit;

  const ProfitCardWidget({
    super.key,
    required this.profit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 18),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: profit.image != null
                    ? SvgPicture.asset(
                        profit.image!,
                      )
                    : Icon(
                        profit.icon,
                        color: Colors.blue,
                      ),
              ),
              MainText(
                profit.title,
                color: Colors.white,
                fontSize: 20,
              ),
              const Spacer(),
              MainText(
                profit.count,
                color: Colors.white,
                fontSize: 16,
              ),
            ],
          ),
          Spacer(),
          MainText(
            profit.amount,
            color: Colors.white,
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
