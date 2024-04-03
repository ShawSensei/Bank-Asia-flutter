import 'package:flutter/material.dart';

import '../constants/ui_constants.dart';

class TransactionBody extends StatelessWidget {
  const TransactionBody({
    super.key,
    required this.date,
    required this.particulars,
    required this.amount,
  });

  final String date, particulars, amount;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black),
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.all(kDefaultPadding / 2),
          //height: 45,

          color: kWhiteColor,
          child: Row(
            children: [
              Expanded(
                child: Text("$date"),
                flex: 2,
              ),
              Expanded(
                child: Text("$particulars"),
                flex: 5,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("$amount"), Icon(Icons.visibility)],
                ),
                flex: 2,
              ),
            ],
          ),

          // child: SvgPicture.asset(icon),
        ),
      ),
    );
  }
}
