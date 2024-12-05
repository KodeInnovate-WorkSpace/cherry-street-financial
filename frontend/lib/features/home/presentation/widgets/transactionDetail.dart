import '../../../../constants/fonts.dart';
import 'package:flutter/material.dart';

class TransactionDetail extends StatelessWidget {
  const TransactionDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "05/18/2022",
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
                  "Starbucks",
                  style: poppinsMedium(
                    size: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  "\$12.43",
                  style: poppinsBold(
                    size: 14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Best Buy",
                  style: poppinsMedium(
                    size: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  "\$12,054.77",
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
