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

      body: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('100.0'),
              subtitle: Text('123-4'),
            ),

          ),Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('200.0'),
              subtitle: Text('456-7'),
            ),

          ),Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('300.0'),
              subtitle: Text('890-1'),
            ),
          ),

        ],
      ),

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
