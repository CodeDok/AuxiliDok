import 'dart:convert';

import 'package:flutter/foundation.dart';

class Repayment {
  final DateTime date;
  final double amount;

  Repayment({
    @required this.amount,
    @required this.date,
  });



  Map<String, dynamic> toMap() {
    return {
      'date': date.toIso8601String(),
      'amount': amount,
    };
  }

  factory Repayment.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Repayment(
      date: DateTime.parse(map['date']),
      amount: map['amount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Repayment.fromJson(String source) => Repayment.fromMap(json.decode(source));
}
