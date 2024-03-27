import 'package:flutter/material.dart';

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
  final CardInfoModel? cardInfo; // Receive CardInfoModel as a parameter

  CardInfoFragment({super.key, this.cardInfo});

  @override
  _CardInfoFragmentState createState() => _CardInfoFragmentState();
}

class _CardInfoFragmentState extends State<CardInfoFragment> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CardsFromCardInfo(
        credit: widget.cardInfo!.credit!,
        // Use credit from CardInfoModel
        dueAmount: widget.cardInfo!.dueAmount!,
        // Use dueAmount from CardInfoModel
        minimum: widget.cardInfo!.minimum!,
        // Use minimum from CardInfoModel
        date: widget.cardInfo!.date!, // Use date from CardInfoModel
      ),
    );
  }
}
