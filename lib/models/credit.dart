import 'dart:convert';

import 'package:flutter/foundation.dart';

class Credit {
  final String interestInterval;
  final int interestPercentage;
  final List<String> debtors;
  final double loanedAmount;
  final String currency;
  final String name;
  final String id;
  final Map<dynamic, dynamic>repayments;
  final DateTime startDate;
  final DateTime endDate;

  Credit ({
    this.id,
    @required this.name,
    @required this.loanedAmount,
    this.currency,
    this.repayments,
    @required this.debtors,
    this.interestInterval,
    this.interestPercentage,
    this.startDate,
    this.endDate,
  });

  Credit.fromData(Map<String,dynamic> data) 
    : id = data['id'],
      name = data['name'],
      loanedAmount = data['loanedAmount'],
      currency = data['loanedAmount'],
      repayments = data['repayments'],
      debtors = data['debtors'],
      interestInterval = data['interestInverval'],
      interestPercentage = data['interestPercentage'],
      startDate = data['startDate'],
      endDate = data['endDate'];
  
  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name' : name,
      'loanedAmount' : loanedAmount,
      'currency' : currency,
      'repayments' : json.encode(repayments),
      'debtors' : json.encode(debtors),
      'interestInterval' : interestInterval,
      'interestPercentage' : interestPercentage,
      'startDate' : startDate.toIso8601String(),
      'endDate' : endDate.toIso8601String(),
    };
  }


}