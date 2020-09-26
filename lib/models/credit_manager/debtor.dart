import 'dart:convert';

import 'package:flutter/foundation.dart';

class Debtor {

  final String name;

  Debtor({@required this.name});




  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory Debtor.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Debtor(
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Debtor.fromJson(String source) => Debtor.fromMap(json.decode(source));
}
