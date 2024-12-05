import 'dart:convert';
import 'dart:developer';
import 'package:cherrystreet/features/home/data/models/transaction_model.dart';
import 'package:http/http.dart' as http;

import '../../../../constants/baseUrl.dart';

class TransactionRemoteDataSource {
  Future<List<TransactionModel>> fetchTransactions() async {
    final response = await http.get(Uri.parse('$baseUrl/transaction/transaction'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      log("Datatype = ${jsonData.runtimeType}");

      final List<dynamic> transactions = jsonData['transaction'];
      log("Transactions List = $transactions");

      return transactions.map((item) {
        return TransactionModel.fromJson(item);
      }).toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }

}
