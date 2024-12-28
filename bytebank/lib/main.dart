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
        Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('100.0'),
            subtitle: Text('1234-5'),
          ),

        ),Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('200.0'),
            subtitle: Text('6789-1'),
          ),

        ),Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('300.0'),
            subtitle: Text('2345-6'),
          ),
        ),

      ],
    );
  }
}
