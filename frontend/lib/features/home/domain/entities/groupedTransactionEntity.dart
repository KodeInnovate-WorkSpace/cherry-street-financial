import 'package:cherrystreet/features/home/domain/entities/transaction_entity.dart';

class GroupedTransactionEntity {
  final String month;
  final Map<String, List<TransactionEntity>> transactionsByDate;

  GroupedTransactionEntity({
    required this.month,
    required this.transactionsByDate,
  });
}
