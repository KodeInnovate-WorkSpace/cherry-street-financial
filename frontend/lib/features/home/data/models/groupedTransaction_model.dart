import 'package:cherrystreet/features/home/data/models/transaction_model.dart';
import 'package:cherrystreet/features/home/domain/entities/groupedTransactionEntity.dart';

class GroupedTransactionModel extends GroupedTransactionEntity {
  GroupedTransactionModel({
    required super.month,
    required super.transactionsByDate,
  });

  factory GroupedTransactionModel.fromJson(Map<String, dynamic> json) {
    final month = json['month'] as String;
    final transactions = (json['transactions'] as List<dynamic>).map((transaction) {
      return TransactionModel.fromJson(transaction as Map<String, dynamic>);
    }).toList();

    final transactionsByDate = <String, List<TransactionModel>>{};
    for (var transaction in transactions) {
      final dateKey = transaction.day;
      transactionsByDate.putIfAbsent(dateKey, () => []).add(transaction);
    }

    return GroupedTransactionModel(
      month: month,
      transactionsByDate: transactionsByDate,
    );
  }
}
