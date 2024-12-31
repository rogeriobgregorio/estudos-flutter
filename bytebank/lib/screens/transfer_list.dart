import 'package:bytebank/screens/transfer_form.dart';
import 'package:flutter/material.dart';
import '../components/transfer_item.dart';
import '../models/transfer.dart';

const String _titleAppBar = 'Transferências';

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
          _titleAppBar,
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return TransferForm();
            }),
          ).then(
            (transferReceived) => _updateTransferList(transferReceived),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _updateTransferList(Transfer transfer) {
    setState(() {
      _transfers.add(transfer);
    });
  }
}
