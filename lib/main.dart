import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BytebankApp());
  // save(Transaction(200.0, Contact(0, 'Gui', 2000)))
  //     .then((transaction) => print(transaction));
  // findAll()
  //.then((transactions) => print('new transactions -> $transactions'));
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
        ).copyWith(
          primary: Colors.green[900],
          secondary: Colors.blueAccent[700],
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
