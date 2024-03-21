import 'package:flutter/material.dart';

import '../../utils/cards_from_card_info.dart';

class CardInfoFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CardsFromCardInfo(),
    );
  }
}