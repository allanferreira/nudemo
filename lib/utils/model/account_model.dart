/// Created using https://app.quicktype.io?share=qUgMeaBQgtP5y5fJUcdw
/// with schema https://git.io/JejQF
///
/// [Quicktype] is simplest that [json_serializable] and
/// [json_annotation] plugin...
/// Perfect for this demo (but isn't professional! 👨‍💻).
/// - https://pub.dev/packages/json_serializable
/// - https://pub.dev/packages/json_annotation
///
/// To parse this JSON data, do
///   `final account = accountFromJson(jsonString);`

import 'dart:convert';

/// Mapping Json data -> Account
Account accountFromJson(String str) => Account.fromJson(json.decode(str));

/// Mapping Account data -> Json
String accountToJson(Account data) => json.encode(data.toJson());

/// Mapping a list of Json data -> Account
List<Account> allAccountsFromJson(String str) =>
    List<Account>.from(json.decode(str).map((x) => Account.fromJson(x)));

/// Mapping a list of Map data -> Account
List<Account> allAccountsFromMapList(List<dynamic> mapList) =>
    List<Account>.from(mapList.map((x) => Account.fromJson(x)));

/// Mapping a list of Account data -> Json
String allAccountsToJson(List<Account> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Account {
  final String accountId;
  final String customerId;
  final String bankBranch;
  final String bankAccount;
  final double limit;

  Account({
    this.accountId,
    this.customerId,
    this.bankBranch,
    this.bankAccount,
    this.limit,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        accountId: json["account-id"] == null ? null : json["account-id"],
        customerId: json["customer-id"] == null ? null : json["customer-id"],
        bankBranch: json["bank-branch"] == null ? null : json["bank-branch"],
        bankAccount: json["bank-account"] == null ? null : json["bank-account"],
        limit: json["limit"] == null ? null : json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "account-id": accountId == null ? null : accountId,
        "customer-id": customerId == null ? null : customerId,
        "bank-branch": bankBranch == null ? null : bankBranch,
        "bank-account": bankAccount == null ? null : bankAccount,
        "limit": limit == null ? null : limit,
      };
}
