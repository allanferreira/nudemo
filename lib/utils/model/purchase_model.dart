/// Created using https://app.quicktype.io?share=IqDmqmbCQ2nUrbkSgQ7p
/// with schema https://git.io/JveeW
///
/// [Quicktype] is simplest that [json_serializable] and
/// [json_annotation] plugin...
/// Perfect for this demo (but isn't professional! 👨‍💻).
/// - https://pub.dev/packages/json_serializable
/// - https://pub.dev/packages/json_annotation
///
/// To parse this JSON data, do
///   `final purchase = purchaseFromJson(jsonString);`

import 'dart:convert';

/// Mapping Json data -> Purchase
Purchase purchaseFromJson(String str) => Purchase.fromJson(json.decode(str));

/// Mapping Purchase data -> Json
String purchaseToJson(Purchase data) => json.encode(data.toJson());

/// Mapping a list of Json data -> Purchase
List<Purchase> allPurchasesFromJson(String str) =>
    List<Purchase>.from(json.decode(str).map((x) => Purchase.fromJson(x)));

/// Mapping a list of Map data -> Purchase
List<Purchase> allPurchasesFromMapList(List<dynamic> mapList) =>
    List<Purchase>.from(mapList.map((x) => Purchase.fromJson(x)));

/// Mapping a list of Purchase data -> Json
String allPurchasesToJson(List<Purchase> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Purchase {
  final String purchaseId;
  final String accountId;
  final String type;
  final double value;
  final DateTime date;
  final Origin origin;
  final List<String> tag;

  Purchase({
    this.purchaseId,
    this.accountId,
    this.type,
    this.value,
    this.date,
    this.origin,
    this.tag,
  });

  factory Purchase.fromJson(Map<String, dynamic> json) => Purchase(
        purchaseId: json["purchase-id"] == null ? null : json["purchase-id"],
        accountId: json["account-id"] == null ? null : json["account-id"],
        type: json["type"] == null ? null : json["type"],
        value: json["value"] == null ? null : json["value"].toDouble(),
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        origin: json["origin"] == null ? null : Origin.fromJson(json["origin"]),
        tag: json["tag"] == null
            ? null
            : List<String>.from(json["tag"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "purchase-id": purchaseId == null ? null : purchaseId,
        "account-id": accountId == null ? null : accountId,
        "type": type == null ? null : type,
        "value": value == null ? null : value,
        "date": date == null ? null : date.toIso8601String(),
        "origin": origin == null ? null : origin.toJson(),
        "tag": tag == null ? null : List<dynamic>.from(tag.map((x) => x)),
      };
}

class Origin {
  final int code;
  final String name;

  Origin({
    this.code,
    this.name,
  });

  factory Origin.fromJson(Map<String, dynamic> json) => Origin(
        code: json["code"] == null ? null : json["code"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "name": name == null ? null : name,
      };
}

/// Created using https://app.quicktype.io?share=KhHFbyxkiLrCXDKXGhCG
/// with schema https://git.io/Jvv2R
///
/// To parse this JSON data, do
///   `final balance = balanceFromJson(jsonString);`
Balance balanceFromJson(String str) => Balance.fromJson(json.decode(str));

String balanceToJson(Balance data) => json.encode(data.toJson());

class Balance {
  final double balance;

  Balance({
    this.balance,
  });

  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        balance: json["balance"] == null ? null : json["balance"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "balance": balance == null ? null : balance,
      };
}
