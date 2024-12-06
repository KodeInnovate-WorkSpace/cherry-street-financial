import 'package:cherrystreet/features/home/domain/entities/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  TransactionModel({
    required super.month,
    required super.day,
    required super.purchase,
    required super.cost,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      month: json['month'] ?? 'Unknown Month',
      day: json['day'] ?? 'Unknown Day',
      purchase: json['purchase'] ?? 'Unknown Purchase',
      cost: _parseCost(json['cost']),
    );
  }

  
  static double _parseCost(dynamic cost) {
    if (cost is num) {
      return cost.toDouble();
    } else if (cost is String) {
      
      return double.tryParse(cost) ?? 0.0;
    } else {
      return 0.0; 
    }
  }
}
