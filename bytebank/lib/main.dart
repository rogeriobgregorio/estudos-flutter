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
        TransferItem(Transfer(1000.0, 12345)),
        TransferItem(Transfer(2000.0, 67891)),
        TransferItem(Transfer(3000.0, 2345-6)),
      ],
    );
  }
}

class TransferItem extends StatelessWidget {

  final Transfer _transfer;

  const TransferItem(this._transfer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}

class Transfer {

   final double value;
   final int accountNumber;

   Transfer(this.value, this.accountNumber);
}
