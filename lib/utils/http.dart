import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'package:nudemo/utils/config.dart';
import 'package:nudemo/utils/model/customer_model.dart';
import 'package:nudemo/utils/model/account_model.dart';
import 'package:nudemo/utils/model/purchase_model.dart';

class Http {
  static Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  /// Get data from API endpoint [GET]
  Future<Map<String, dynamic>> loadDataFromAPI({
    @required http.Client httpClient,
    @required String endPoint,
  }) async {
    http.Response response;
    try {
      response = await httpClient.get(
        endPoint,
        headers: requestHeaders,
      );

      if (response != null) {
        return {
          "statusCode": response.statusCode,
          "body": json.decode(response.body),
        };
      }

      throw Exception('Failed to load data from API: $endPoint');
    } catch (e) {
      // If that call was not successful, throw an error.
      // print('Exception: ${e.toString()}');
    }
    return null;
  }

  /// Send data to API endpoint [POST]
  Future<Map<String, dynamic>> sendDataToAPI({
    @required http.Client httpClient,
    @required String endPoint,
    @required String data,
  }) async {
    http.Response response;
    try {
      response = await httpClient.post(
        endPoint,
        body: data,
        headers: requestHeaders,
      );

      if (response != null) {
        return {
          "statusCode": response.statusCode,
          "body": json.decode(response.body),
        };
      }

      throw Exception('Failed to send data ($data) to API: $endPoint');
    } catch (e) {
      // If that call was not successful, throw an error.
      // print('Exception: ${e.toString()}');
    }
    return null;
  }

  /// Check health of [Customer API]
  Future<bool> checkHealthCustomerApi({
    @required http.Client httpClient,
  }) async {
    Map<String, dynamic> response = await this.loadDataFromAPI(
      httpClient: httpClient,
      endPoint: Config.customerEndPoint,
    );
    // print('Check Customer API: $response');

    return (response != null && response['statusCode'] == 200);
  }

  /// Create new customer [Customer API]
  Future<Customer> createCustomerApi({
    @required http.Client httpClient,
    @required Customer customerData,
  }) async {
    Map<String, dynamic> response = await this.sendDataToAPI(
      httpClient: httpClient,
      endPoint: Config.customerRegisterEndPoint,
      data: customerToJson(customerData),
    );
    // print('Create Customer API: $response');

    return (response != null && response['statusCode'] == 201)
        ? Customer.fromJson(response['body'])
        : null;
  }

  /// Check health of [Account API]
  Future<bool> checkHealthAccountApi({
    @required http.Client httpClient,
  }) async {
    Map<String, dynamic> response = await this.loadDataFromAPI(
      httpClient: httpClient,
      endPoint: Config.accountEndPoint,
    );
    // print('Check Account API: $response');

    return (response != null && response['statusCode'] == 200);
  }

  /// Create new account [Account API]
  Future<Account> createAccountApi({
    @required http.Client httpClient,
    @required Account accountData,
  }) async {
    Map<String, dynamic> response = await this.sendDataToAPI(
      httpClient: httpClient,
      endPoint: Config.accountRegisterEndPoint,
      data: accountToJson(accountData),
    );
    // print('Create Account API: $response');

    return (response != null && response['statusCode'] == 201)
        ? Account.fromJson(response['body'])
        : null;
  }

  /// Check health of [Purchase API]
  Future<bool> checkHealthPurchaseApi({
    @required http.Client httpClient,
  }) async {
    Map<String, dynamic> response = await this.loadDataFromAPI(
      httpClient: httpClient,
      endPoint: Config.purchaseEndPoint,
    );
    // print('Check Purchase API: $response');

    return (response != null && response['statusCode'] == 200);
  }

  /// Create new purchase [Purchase API]
  Future<Purchase> createPurchaseApi({
    @required http.Client httpClient,
    @required Purchase purchaseData,
  }) async {
    Map<String, dynamic> response = await this.sendDataToAPI(
      httpClient: httpClient,
      endPoint: Config.purchaseRegisterEndPoint,
      data: purchaseToJson(purchaseData),
    );
    // print('Create Purchase API: $response');

    return (response != null && response['statusCode'] == 201)
        ? Purchase.fromJson(response['body'])
        : null;
  }
}
