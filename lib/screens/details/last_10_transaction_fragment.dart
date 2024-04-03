import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/ui_constants.dart';
import '../../utils/transaction_body.dart';

class Last10TransactionFragment extends StatelessWidget {
  final String date, id, amount;

  Last10TransactionFragment({required this.date, required this.id, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black),
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.all(kDefaultPadding / 2),
            height: 45,

            color: kWhiteColor,
            child: Row(
              children: [
                Expanded(
                  child: Text("Date"),
                  flex: 2,
                ),
                Expanded(
                  child: Text("Partculars"),
                  flex: 5,
                ),
                Expanded(
                  child: Text("Amount"),
                  flex: 2,
                ),
              ],
            ),

            // child: SvgPicture.asset(icon),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TransactionBody(
                  date: date,
                  particulars: 'NPSB IBFT $id from Bank Asia',
                  amount: amount,
                ),
                TransactionBody(
                  date: date,
                  particulars: 'NPSB IBFT $id from Bank Asia',
                  amount: amount,
                ),
                TransactionBody(
                  date: date,
                  particulars: 'NPSB IBFT $id from Bank Asia',
                  amount: amount,
                ),
                TransactionBody(
                  date: date,
                  particulars: 'NPSB IBFT $id from Bank Asia',
                  amount: amount,
                ),
                TransactionBody(
                  date: date,
                  particulars: 'NPSB IBFT $id from Bank Asia',
                  amount: amount,
                ),
                TransactionBody(
                  date: date,
                  particulars: 'NPSB IBFT $id from Bank Asia',
                  amount: amount,
                ),
                TransactionBody(
                  date: date,
                  particulars: 'NPSB IBFT $id from Bank Asia',
                  amount: amount,
                ),
                TransactionBody(
                  date: date,
                  particulars: 'NPSB IBFT $id from Bank Asia',
                  amount: amount,
                ),
                TransactionBody(
                  date: date,
                  particulars: 'NPSB IBFT $id from Bank Asia',
                  amount: amount,
                ),
                TransactionBody(
                  date: date,
                  particulars: 'NPSB IBFT $id from Bank Asia',
                  amount: amount,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
