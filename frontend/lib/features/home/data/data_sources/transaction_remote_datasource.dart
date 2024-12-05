import 'dart:convert';
import 'package:cherrystreet/features/home/data/models/transaction_model.dart';
import 'package:http/http.dart' as http;

import '../../../../constants/baseUrl.dart';

class TransactionRemoteDataSource {
  Future<List<TransactionModel>> fetchTransactions() async {
    final response = await http.get(Uri.parse('$baseUrl/transaction/transaction'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => TransactionModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }
}
