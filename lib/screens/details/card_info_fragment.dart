import 'package:flutter/material.dart';

import '../../responseModels/card_info_res_model.dart';
import '../../utils/cards_from_card_info.dart';

// class CardInfoFragment extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: CardsFromCardInfo(
//         credit: '1,72,800.00 BDT',
//         dueAmount: '0.0 BDT',
//         minimum: '0.0 BDT',
//         date: '12/11/2023',
//       ),
//     );
//   }
// }

import '../../models/card_model.dart'; // Import CardInfoModel

class CardInfoFragment extends StatefulWidget {
  final CardInfoResModel cardInfo; // Receive CardInfoResModel as a parameter

  CardInfoFragment({super.key, required this.cardInfo});

  @override
  _CardInfoFragmentState createState() => _CardInfoFragmentState();
}

class _CardInfoFragmentState extends State<CardInfoFragment> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CardsFromCardInfo(
        credit: widget.cardInfo!.accountNo!,
        // Use credit from CardInfoModel
        dueAmount: widget.cardInfo!.outstandingUSD!,
        // Use dueAmount from CardInfoModel
        minPaymentBDT: widget.cardInfo!.minPaymentBDT!,
        // Use minimum from CardInfoModel
        date: widget.cardInfo!.paymentDueDate!,
        minPaymentUSD: widget.cardInfo!.minPaymentUSD!, // Use date from CardInfoModel
      ),
    );
  }
}
