import 'dart:convert';

import 'package:auxilidok/app/constants.dart';

import 'debtor.dart';
import 'repayment.dart';

class Credit {
  final String interestInterval;
  final int interestPercentage;
  final List<Debtor> debtors;
  final double loanedAmount;
  final String currency;
  final String name;
  final String id;
  final List<Repayment> repayments;
  final DateTime startDate;
  final DateTime endDate;
  final bool archived;

  Credit({
    this.id,
    this.name,
    this.loanedAmount,
    this.currency,
    this.repayments,
    this.debtors,
    this.interestInterval,
    this.interestPercentage,
    this.startDate,
    this.endDate,
    this.archived
  });

  Map<String, dynamic> toMap() {
    return {
      'interestInterval': interestInterval,
      'interestPercentage': interestPercentage,
      'debtors': debtors?.map((x) => x.toMap())?.toList(),
      'loanedAmount': loanedAmount,
      'currency': currency,
      'name': name,
      'id': id,
      'repayments': repayments?.map((x) => x.toMap())?.toList(),
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'archived' : archived,
    };
  }

  factory Credit.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Credit(
      interestInterval: map['interestInterval'],
      interestPercentage: map['interestPercentage'],
      debtors: List.of(map['debtors'].map((x) => Debtor.fromMap(x))).cast<Debtor>(),
      repayments: List.of(map['repayments'].map((x) => Repayment.fromMap(x))).cast<Repayment>(),
      loanedAmount: map['loanedAmount'],
      currency: map['currency'],
      name: map['name'],
      id: map['id'],
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
      archived: map['archived']
    );
  }

  static int getInterval(String interval) {
    switch (interval) {
        case cm_daily:
          return 1;
          break;
        case cm_weekly:
          return 7;
          break;
        case cm_monthly:
          return 30;
          break;
        case cm_yearly:
          return 365;
          break;
        default:
          return 1;
      }
  }

  String toJson() => json.encode(toMap());

  factory Credit.fromJson(String source) => Credit.fromMap(json.decode(source));
}
