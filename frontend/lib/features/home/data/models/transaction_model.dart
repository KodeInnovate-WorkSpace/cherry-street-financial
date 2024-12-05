import 'package:cherrystreet/features/home/domain/entities/transaction_entity.dart';
import 'package:intl/intl.dart';

class TransactionModel extends TransactionEntity {
  TransactionModel({
    required super.month,
    required super.day,
    required super.purchase,
    required super.cost,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> data) {
    return TransactionModel(
      month: data['month'] ?? '',
      day: data['day'] ?? '',
      purchase: data['purchase'] ?? '',
      cost: data['cost'] is num ? data['cost'] : double.tryParse(data['cost'].toString()) ?? 0.0,
    );
  }
}

class GroupedTransactionModel {
  final String month;
  final Map<String, List<TransactionModel>> transactionsByDate;

  GroupedTransactionModel({
    required this.month,
    required this.transactionsByDate,
  });

  factory GroupedTransactionModel.fromTransactionModelList(List<TransactionModel> transactions) {
    if (transactions.isEmpty) {
      return GroupedTransactionModel(month: "", transactionsByDate: {});
    }

    final month = transactions.first.month;

    final groupedByDate = <String, List<TransactionModel>>{};
    for (var transaction in transactions) {
      groupedByDate.putIfAbsent(transaction.day, () => []).add(transaction);
    }

    return GroupedTransactionModel(month: month, transactionsByDate: groupedByDate);
  }
}
