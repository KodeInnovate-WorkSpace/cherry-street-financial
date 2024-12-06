import '../../data/models/groupedTransaction_model.dart';
import '../../data/models/transaction_model.dart';

class TransactionState {
  final bool isLoading;
  final String error;
  final List<TransactionModel> transactions;
  final List<GroupedTransactionModel> groupedTransactions;

  TransactionState({
    required this.isLoading,
    required this.error,
    required this.transactions,
    required this.groupedTransactions,
  });

  factory TransactionState.initial() {
    return TransactionState(
      isLoading: false,
      error: '',
      transactions: [],
      groupedTransactions: [],
    );
  }

  TransactionState copyWith({
    bool? isLoading,
    String? error,
    List<TransactionModel>? transactions,
    List<GroupedTransactionModel>? groupedTransactions,
  }) {
    return TransactionState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      transactions: transactions ?? this.transactions,
      groupedTransactions: groupedTransactions ?? this.groupedTransactions,
    );
  }
}
