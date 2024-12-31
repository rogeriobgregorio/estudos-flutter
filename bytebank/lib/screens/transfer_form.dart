import 'package:flutter/material.dart';
import '../components/editor.dart';
import '../models/transfer.dart';

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
