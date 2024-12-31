import 'package:flutter/material.dart';
import '../components/editor.dart';
import '../models/transfer.dart';

const String _titleAppBar = 'Criando Transferência';
const String _labelAccountNumberField = 'Número da conta';
const String _hintAccountNumberField = '0000';
const String _labelValueField = 'Valor';
const String _hintValueField = '0000';
const String _textButton = 'Confirmar';

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
          _titleAppBar,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Editor(
            controller: _accountNumberFieldController,
            label: _labelAccountNumberField,
            hint: _hintAccountNumberField,
          ),
          Editor(
            controller: _valueFieldController,
            label: _labelValueField,
            hint: _hintValueField,
            icon: Icons.monetization_on,
          ),
          ElevatedButton(
            onPressed: () => _createTransfer(context),
            child: Text(_textButton),
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
