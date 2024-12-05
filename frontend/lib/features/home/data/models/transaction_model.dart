import 'package:cherrystreet/features/home/domain/entities/transaction_entity.dart';
import 'package:intl/intl.dart';

class TransactionModel extends TransactionEntity {
  TransactionModel({
    required super.purchase,
    required super.cost,
    required super.date,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      purchase: json['purchase'] as String,
      cost: (json['cost'] as num).toDouble(),
      date: DateFormat('yyyy-MM-dd').parse(json['transaction_date']),
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

    final month = DateFormat('MMMM yyyy').format(transactions.first.date);

    final groupedByDate = <String, List<TransactionModel>>{};
    for (var transaction in transactions) {
      final dateKey = DateFormat('MM/dd/yyyy').format(transaction.date);
      groupedByDate.putIfAbsent(dateKey, () => []).add(transaction);
    }

    return GroupedTransactionModel(month: month, transactionsByDate: groupedByDate);
  }
}
