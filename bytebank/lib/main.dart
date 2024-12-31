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

class TransferForm extends StatefulWidget {
  const TransferForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _accountNumberFieldController =
      TextEditingController();
  final TextEditingController _valueFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Criando Transferência',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Editor(
              controller: _accountNumberFieldController,
              label: 'Número da conta',
              hint: '0000'),
          Editor(
              controller: _valueFieldController,
              label: 'Valor',
              hint: '0000',
              icon: Icons.monetization_on),
          ElevatedButton(
            onPressed: () => _createTransfer(context),
            child: Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int? accountNumber = int.tryParse(_accountNumberFieldController.text);
    final double? value = double.tryParse(_valueFieldController.text);
    if (accountNumber != null && value != null) {
      final transferCreated = Transfer(value, accountNumber);
      Navigator.pop(context, transferCreated);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData? icon;

  const Editor(
      {required this.controller,
      required this.label,
      required this.hint,
      this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class TransferList extends StatefulWidget {
  const TransferList({super.key});

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransferList> {
  final List<Transfer> _transfers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transferências',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _transfers.length,
        itemBuilder: (context, index) {
          return TransferItem(_transfers[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          }));
          future.then((transferReceived) {
            if (transferReceived != null) {
              setState(() {
                _transfers.add(transferReceived);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
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

  @override
  String toString() {
    return 'Transfer{value: $value, accountNumber: $accountNumber}';
  }
}
