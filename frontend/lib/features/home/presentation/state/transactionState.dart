import '../../data/models/transaction_model.dart';

class TransactionState {
  final bool isLoading;
  final List<TransactionModel> transactions;
  final String error;

  TransactionState({
    required this.isLoading,
    required this.transactions,
    required this.error,
  });

  factory TransactionState.initial() {
    return TransactionState(
      isLoading: false,
      transactions: [],
      error: '',
    );
  }

  TransactionState copyWith({
    bool? isLoading,
    List<TransactionModel>? transactions,
    String? error,
  }) {
    return TransactionState(
      isLoading: isLoading ?? this.isLoading,
      transactions: transactions ?? this.transactions,
      error: error ?? this.error,
    );
  }
}
