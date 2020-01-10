import 'dart:convert';

import 'package:test/test.dart';

import 'package:nudemo/utils/model/customer_model.dart';

void main() {
  group('[Unit -> Model -> Customer Model] General', () {
    Customer customer;
    final Customer customerData = Customer(
      customerId: 'a1b2c3',
      name: 'Chinnon Santos',
      eMail: 'chinnonsantos@gmail.com',
      phone: '11987654321',
    );
    final Map<String, dynamic> customerJson = {
      'customer-id': 'a1b2c3',
      'name': 'Chinnon Santos',
      'e-mail': 'chinnonsantos@gmail.com',
      'phone': '11987654321'
    };
    final String customerJsonString =
        '{"customer-id":"a1b2c3","name":"Chinnon Santos","e-mail":"chinnonsantos@gmail.com","phone":"11987654321"}';
    final String customersJsonString = '['
        '{"customer-id":"a1b2c3","name":"Chinnon Santos","e-mail":"chinnonsantos@gmail.com","phone":"11987654321"},'
        '{"customer-id":"a1b2c3d4e5","name":"Chinnon S.","e-mail":"contato@chinnonsantos.com.br","phone":"11999999999"}'
        ']';

    setUp(() {
      customer = Customer();
    });

    test('initial value of `customerId` should be null', () {
      expect(customer.customerId, null);
    });

    test('initial value of `name` should be null', () {
      expect(customer.name, null);
    });

    test('initial value of `eMail` should be null', () {
      expect(customer.eMail, null);
    });

    test('initial value of `phone` should be null', () {
      expect(customer.phone, null);
    });

    test('initiate class with data', () {
      expect(customerData.customerId, 'a1b2c3');
      expect(customerData.name, 'Chinnon Santos');
      expect(customerData.eMail, 'chinnonsantos@gmail.com');
      expect(customerData.phone, '11987654321');
    });

    test('initiate class null and then change the data', () {
      expect(customer.customerId, null);
      expect(customer.name, null);
      expect(customer.eMail, null);
      expect(customer.phone, null);

      customer = Customer(
        customerId: 'a1b2c3',
        name: 'Chinnon Santos',
        eMail: 'chinnonsantos@gmail.com',
        phone: '11987654321',
      );

      expect(customer.customerId, 'a1b2c3');
      expect(customer.name, 'Chinnon Santos');
      expect(customer.eMail, 'chinnonsantos@gmail.com');
      expect(customer.phone, '11987654321');
    });

    test('check value of `Customer.fromJson()`', () {
      Customer newCustomer = Customer.fromJson(customerJson);

      expect(newCustomer.customerId, 'a1b2c3');
      expect(newCustomer.name, 'Chinnon Santos');
      expect(newCustomer.eMail, 'chinnonsantos@gmail.com');
      expect(newCustomer.phone, '11987654321');
    });

    test('check value of `toJson()`', () {
      Map<String, dynamic> jsonData = customerData.toJson();

      expect(jsonData, customerJson);
    });

    test('check value of `customerFromJson()`', () {
      Customer newCustomer = customerFromJson(customerJsonString);

      expect(newCustomer.customerId, 'a1b2c3');
      expect(newCustomer.name, 'Chinnon Santos');
      expect(newCustomer.eMail, 'chinnonsantos@gmail.com');
      expect(newCustomer.phone, '11987654321');
    });

    test('check value of `customerToJson()`', () {
      String jsonData = customerToJson(customerData);

      expect(jsonData, customerJsonString);
    });

    test('check value of `allCustomersFromJson()`', () {
      List<Customer> newCustomer = allCustomersFromJson(customersJsonString);

      expect(newCustomer[0].customerId, 'a1b2c3');
      expect(newCustomer[0].name, 'Chinnon Santos');
      expect(newCustomer[0].eMail, 'chinnonsantos@gmail.com');
      expect(newCustomer[0].phone, '11987654321');

      expect(newCustomer[1].customerId, 'a1b2c3d4e5');
      expect(newCustomer[1].name, 'Chinnon S.');
      expect(newCustomer[1].eMail, 'contato@chinnonsantos.com.br');
      expect(newCustomer[1].phone, '11999999999');
    });

    test('check value of `allCustomersFromMapList()`', () {
      List<Customer> newCustomer = allCustomersFromMapList(
        json.decode(customersJsonString),
      );

      expect(newCustomer[0].customerId, 'a1b2c3');
      expect(newCustomer[0].name, 'Chinnon Santos');
      expect(newCustomer[0].eMail, 'chinnonsantos@gmail.com');
      expect(newCustomer[0].phone, '11987654321');

      expect(newCustomer[1].customerId, 'a1b2c3d4e5');
      expect(newCustomer[1].name, 'Chinnon S.');
      expect(newCustomer[1].eMail, 'contato@chinnonsantos.com.br');
      expect(newCustomer[1].phone, '11999999999');
    });

    test('check value of `allCustomersToJson()`', () {
      String jsonData = allCustomersToJson([
        customerData,
        Customer(
          customerId: 'a1b2c3d4e5',
          name: 'Chinnon S.',
          eMail: 'contato@chinnonsantos.com.br',
          phone: '11999999999',
        ),
      ]);

      expect(jsonData, customersJsonString);
    });
  });
}
