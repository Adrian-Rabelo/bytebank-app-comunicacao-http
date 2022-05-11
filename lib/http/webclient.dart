import 'dart:convert';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('Request:');
    print('url -> ${data.url}');
    print('headers -> ${data.headers}');
    print('body -> ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('Response:');
    print('status code -> ${data.statusCode}');
    print('headers -> ${data.headers}');
    print('body -> ${data.body}');
    return data;
  }
}

Future<List<Transaction>> findAll() async {
  final Client client = InterceptedClient.build(
    interceptors: [
      LoggingInterceptor(),
    ],
  );
  final Response response = await client
      .get(Uri.parse('http://192.168.0.141:8080/transactions'))
      .timeout(const Duration(seconds: 5)); // casa
  // await client
  //.get(Uri.parse('http://172.22.4.121:8080/transactions'))
  //.timeout(const Duration(seconds: 5)); // tj
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Transaction> transactions = [];
  for (Map<String, dynamic> transactionJson in decodedJson) {
    final Map<String, dynamic> contactJson = transactionJson['contact'];
    final Transaction transaction = Transaction(
      transactionJson['value'],
      Contact(
        0,
        contactJson['name'],
        contactJson['accountNumber'],
      ),
    );
    transactions.add(transaction);
  }
  return transactions;
}
