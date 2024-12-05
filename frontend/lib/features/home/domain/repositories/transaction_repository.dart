import 'package:cherrystreet/features/home/data/models/transaction_model.dart';

abstract interface class TransactionRepository {
  Future<List<TransactionModel>> fetchTransaction();
}
