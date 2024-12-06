import '../../../../constants/fonts.dart';
import 'package:flutter/material.dart';

class TransactionDetail extends StatelessWidget {
  final String purchase;
  final double cost;
final String day;
  const TransactionDetail({
    super.key,
    required this.purchase,
    required this.cost,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            day,
            style: poppinsBold(
              size: 14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  purchase, 
                  style: poppinsMedium(
                    size: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  "\$${cost.toStringAsFixed(2)}", 
                  style: poppinsBold(
                    size: 14,
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
