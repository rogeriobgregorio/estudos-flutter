import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          'Transferências',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),

      body: TransferList(),

      floatingActionButton: FloatingActionButton(
        onPressed: () => print("Teste botão"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),

    ),
  ));
}

class TransferList extends StatelessWidget {
  const TransferList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransferItem('1000.0', '1234-5'),
        TransferItem('2000.0', '6789-1'),
        TransferItem('3000.0', '2345-6')
      ],
    );
  }
}

class TransferItem extends StatelessWidget {

  final String value;
  final String accountNumber;

  const TransferItem(this.value, this.accountNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(value),
        subtitle: Text(accountNumber),
      ),
    );
  }
}
