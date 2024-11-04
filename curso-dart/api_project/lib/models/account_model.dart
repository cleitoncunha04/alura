import 'dart:convert';

class AccountModel {
  final String _id;
  final String _name;
  final String _lastName;
  final double _balance;

  AccountModel.constructor(
      {required String id,
      required String name,
      required String lastName,
      required double balance})
      : _id = id,
        _name = name,
        _lastName = lastName,
        _balance = balance;

  // uso o factory para converter meu construtor ".fromMap()" no meu construtor .constructor()
  factory AccountModel.fromMap(Map<String, dynamic> accountMap) {
    return AccountModel.constructor(
      id: accountMap['id'],
      name: accountMap['name'],
      lastName: accountMap['lastName'],
      balance: (accountMap['balance'] is String)
          ? double.tryParse(accountMap['balance']) ?? 0.0
          : accountMap['balance'] as double? ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': _id,
      'name': _name,
      'lastName': _lastName,
      'balance': _balance
    };
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source));

  AccountModel copyWith({
    String? id,
    String? name,
    String? lastName,
    double? balance,
  }) {
    return AccountModel.constructor(
      id: id ?? _id,
      name: name ?? _name,
      lastName: lastName ?? _lastName,
      balance: balance ?? _balance,
    );
  }

  @override
  String toString() {
    return 'Account: $_id: $_name $_lastName, balance: $_balance\n';
  }

  @override
  int get hashCode {
    return _id.hashCode ^
        _name.hashCode ^
        _lastName.hashCode ^
        _balance.hashCode;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AccountModel &&
        other._id == _id &&
        other._name == _name &&
        other._lastName == _lastName &&
        other._balance == _balance;
  }

  String get id => _id;
}
