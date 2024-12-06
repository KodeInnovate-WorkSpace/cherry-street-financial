import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../../../constants/baseUrl.dart';
import '../models/groupedTransaction_model.dart';

class TransactionRemoteDataSource {
  Future<List<GroupedTransactionModel>> fetchTransactions() async {
    final response = await http.get(Uri.parse('$baseUrl/transaction/transaction'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);

      final List<dynamic> transactions = jsonData['transaction'];

      return transactions.map((item) {
        try {
          return GroupedTransactionModel.fromJson(item as Map<String, dynamic>);
        } catch (e) {
          log("Error parsing grouped transaction item: $item. Error: $e");
          rethrow;
        }
      }).toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }
}
