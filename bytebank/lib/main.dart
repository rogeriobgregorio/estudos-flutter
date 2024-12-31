import 'package:bytebank/screens/transfer_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransferList(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[900],
          iconTheme: IconThemeData(color: Colors.white),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.green[900],
          foregroundColor: Colors.white,
          shape: CircleBorder(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[900],
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}










