import 'package:cherrystreet/features/home/data/repositories/transaction_repository_impl.dart';

import 'package:bloc/bloc.dart';
import 'package:cherrystreet/features/home/presentation/state/transactionState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/transaction_model.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final TransactionRepositoryImpl transactionRepository;

  TransactionCubit(this.transactionRepository) : super(TransactionState.initial());

  Future<void> fetchTransactions() async {
    emit(state.copyWith(isLoading: true));
    try {
      final transactions = await transactionRepository.fetchTransactions();

      final allTransactions = transactions.expand((group) => group.transactionsByDate.values.expand((list) => list)).toList();

      emit(state.copyWith(
        isLoading: false,
        transactions: allTransactions.cast<TransactionModel>(),
        groupedTransactions: transactions,
        error: '',
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }
}
