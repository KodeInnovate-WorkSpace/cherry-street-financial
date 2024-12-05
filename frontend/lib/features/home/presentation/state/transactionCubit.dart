import 'package:cherrystreet/features/home/data/repositories/transaction_repository_impl.dart';

import 'package:bloc/bloc.dart';
import 'package:cherrystreet/features/home/presentation/state/transactionState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final TransactionRepositoryImpl transactionRepository;

  TransactionCubit(this.transactionRepository) : super(TransactionState.initial());

  Future<void> fetchTransactions() async {
    emit(state.copyWith(isLoading: true));
    try {
      final transactions = await transactionRepository.fetchTransaction();
      emit(state.copyWith(
        isLoading: false,
        transactions: transactions,
        error: '',
      ));
    } catch (e) {
      print('Error in Cubit: $e');
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }
}
