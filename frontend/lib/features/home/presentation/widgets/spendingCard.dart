import 'package:cherrystreet/features/home/presentation/widgets/transactionDetail.dart';
import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class SpendingCard extends StatelessWidget {
  const SpendingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 340,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Transaction one
                RichText(
                  text: TextSpan(
                    text: "Transactions: ",
                    style: poppinsBold(
                      size: 16,
                      color: AppColors.primaryClr,
                    ),
                    children: [
                      TextSpan(
                        text: "May 2022",
                        style: poppinsRegular(
                          size: 16,
                          color: AppColors.primaryClr,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Purchase",
                      style: poppinsSemiBold(size: 10, color: Colors.grey.shade700),
                    ),
                    Text(
                      "Cost",
                      style: poppinsSemiBold(size: 10, color: Colors.grey.shade700),
                    ),
                  ],
                ),
                const TransactionDetail(),
                const TransactionDetail(),
                const TransactionDetail(),
                const TransactionDetail(),

                // Transaction two
                const SizedBox(height: 15),
                RichText(
                  text: TextSpan(
                    text: "Transactions: ",
                    style: poppinsBold(
                      size: 16,
                      color: AppColors.primaryClr,
                    ),
                    children: [
                      TextSpan(
                        text: "June 2022",
                        style: poppinsRegular(
                          size: 16,
                          color: AppColors.primaryClr,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Purchase",
                      style: poppinsSemiBold(size: 10, color: Colors.grey.shade700),
                    ),
                    Text(
                      "Cost",
                      style: poppinsSemiBold(size: 10, color: Colors.grey.shade700),
                    ),
                  ],
                ),
                const TransactionDetail(),
                const TransactionDetail(),
                const TransactionDetail(),
                const TransactionDetail(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
