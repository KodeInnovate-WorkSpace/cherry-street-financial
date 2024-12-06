import '../../data/models/groupedTransaction_model.dart';

abstract interface class TransactionRepository {
  Future<List<GroupedTransactionModel>> fetchTransactions() ;
}
