import 'dart:developer';

import '../../domain/repositories/transaction_repository.dart';
import '../data_sources/transaction_remote_datasource.dart';
import '../models/transaction_model.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDataSource remoteDataSource;
  TransactionRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<TransactionModel>> fetchTransaction() async {
    try {
      return await remoteDataSource.fetchTransactions();
    } catch (e) {
      log("Error getting transactions: $e");
      rethrow;
    }
  }
}
