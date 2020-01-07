import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'package:nudemo/utils/config.dart';
import 'package:nudemo/utils/model/customer_model.dart';

class Http {
  final _timeoutRequest = const Duration(seconds: 5);
  final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  /// Get data from API endpoint [GET]
  Future<Map<String, dynamic>> loadDataFromAPI({
    @required String endPoint,
  }) async {
    http.Response response;
    try {
      response = await http
          .get(endPoint, headers: requestHeaders)
          .timeout(_timeoutRequest);

      return {
        "statusCode": response.statusCode,
        "body": json.decode(response.body),
      };
    } catch (e) {
      print('Exception: ${e.toString()}');
    }
    return null;
  }

  /// Send data to API endpoint [POST]
  Future<Map<String, dynamic>> sendDataToAPI({
    @required String endPoint,
    @required String data,
  }) async {
    http.Response response;
    try {
      response = await http
          .post(endPoint, body: data, headers: requestHeaders)
          .timeout(_timeoutRequest);

      return {
        "statusCode": response.statusCode,
        "body": json.decode(response.body),
      };
    } catch (e) {
      print('Exception: ${e.toString()}');
    }
    return null;
  }

  /// Check health of [Customer API]
  Future<bool> checkHealthCustomerApi() async {
    Map<String, dynamic> response = await this.loadDataFromAPI(
      endPoint: Config.customerEndPoint,
    );
    print('Check Customer API: $response');

    return (response != null && response['statusCode'] == 200);
  }

  /// Create new customer [Customer API]
  Future<Customer> createCustomerApi({@required Customer customerData}) async {
    Map<String, dynamic> response = await this.sendDataToAPI(
      endPoint: Config.customerRegisterEndPoint,
      data: customerToJson(customerData),
    );
    print('Create Customer API: $response');

    return (response != null && response['statusCode'] == 201)
        ? Customer.fromJson(response['body'])
        : null;
  }

  /// Check health of [Account API]
  Future<bool> checkHealthAccountApi() async {
    Map<String, dynamic> response = await this.loadDataFromAPI(
      endPoint: Config.accountEndPoint,
    );
    print('Check Account API: $response');

    return (response != null && response['statusCode'] == 200);
  }

  /// Check health of [Purchase API]
  Future<bool> checkHealthPurchaseApi() async {
    Map<String, dynamic> response = await this.loadDataFromAPI(
      endPoint: Config.purchaseEndPoint,
    );
    print('Check Purchase API: $response');

    return (response != null && response['statusCode'] == 200);
  }
}
