/// Created using https://app.quicktype.io?share=2uVtDQgJjf9Wtigm1Gdf
/// with schema https://git.io/Jej9T
///
/// [Quicktype] is simplest that [json_serializable] and
/// [json_annotation] plugin...
/// Perfect for this demo (but isn't professional! 👨‍💻).
/// - https://pub.dev/packages/json_serializable
/// - https://pub.dev/packages/json_annotation
///
/// To parse this JSON data, do
///   `final customer = customerFromJson(jsonString);`

import 'dart:convert';

/// Mapping Json data -> Customer
Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

/// Mapping Customer data -> Json
String customerToJson(Customer data) => json.encode(data.toJson());

/// Mapping a list of Json data -> Customer
List<Customer> allCustomersFromJson(String str) =>
    List<Customer>.from(json.decode(str).map((x) => Customer.fromJson(x)));

/// Mapping a list of Customer data -> Json
String allCustomersToJson(List<Customer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Customer {
  final String customerId;
  final String name;
  final String eMail;
  final String phone;

  Customer({
    this.customerId,
    this.name,
    this.eMail,
    this.phone,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        customerId: json["customer-id"] == null ? null : json["customer-id"],
        name: json["name"] == null ? null : json["name"],
        eMail: json["e-mail"] == null ? null : json["e-mail"],
        phone: json["phone"] == null ? null : json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "customer-id": customerId == null ? null : customerId,
        "name": name == null ? null : name,
        "e-mail": eMail == null ? null : eMail,
        "phone": phone == null ? null : phone,
      };
}
