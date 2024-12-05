import 'dart:developer';

import 'package:cherrystreet/features/home/presentation/widgets/transactionDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';
import '../../data/models/transaction_model.dart';
import '../state/transactionCubit.dart';
import '../state/transactionState.dart';

class SpendingCard extends StatelessWidget {
  const SpendingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.error.isNotEmpty) {
          return Center(child: Text(state.error));
        }

        final groupedTransactions = GroupedTransactionModel.fromTransactionModelList(state.transactions);

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
                    for (var entry in groupedTransactions.transactionsByDate.entries) ...[
                      RichText(
                        text: TextSpan(
                          text: "Transactions: ",
                          style: poppinsBold(
                            size: 16,
                            color: AppColors.primaryClr,
                          ),
                          children: [
                            TextSpan(
                              text: groupedTransactions.month,
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
                      for (var transaction in entry.value) ...[
                        const SizedBox(height: 10),
                        TransactionDetail(
                          purchase: transaction.purchase,
                          cost: transaction.cost,
                          day: transaction.day,
                        ),
                      ],
                      const SizedBox(height: 15),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
