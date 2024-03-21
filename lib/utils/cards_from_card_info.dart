import 'package:bank_asia_flutter/utils/text_body_card_info.dart';
import 'package:bank_asia_flutter/utils/title_with_btn.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CardsFromCardInfo extends StatelessWidget {
  const CardsFromCardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(kDefaultPadding / 2),
            height: 170,
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5, 20),
                    blurRadius: 22,
                    color: kPrimaryColor.withOpacity(0.22),
                  ),
                  BoxShadow(
                      offset: Offset(-15, -15),
                      blurRadius: 20,
                      color: Colors.white60)
                ]),
            child: Column(
              children: [
                TitleWithMoreBtn(
                  title: 'BDT',
                  press: () {},
                ),
                TextBodyCardInfo(
                  text: 'Available Credit Limit',
                  amount: '1,72,800.00 BDT',
                ),
                TextBodyCardInfo(
                  text: 'Total Due Amount',
                  amount: '0.0 BDT',
                ),
                TextBodyCardInfo(
                  text: 'Minimum Due',
                  amount: '0.0 BDT',
                ),
                TextBodyCardInfo(
                  text: 'Payment Due Date',
                  amount: '12/11/2023',
                )
              ],
            )),
        Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(kDefaultPadding / 2),
            height: 170,
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5, 15),
                    blurRadius: 22,
                    color: kPrimaryColor.withOpacity(0.22),
                  ),
                  BoxShadow(
                      offset: Offset(-15, -15),
                      blurRadius: 20,
                      color: Colors.white60)
                ]),
            child: Column(
              children: [
                TitleWithMoreBtn(
                  title: 'USD',
                  press: () {},
                ),
                TextBodyCardInfo(
                  text: 'Available Credit Limit',
                  amount: '1,72,800.00 BDT',
                ),
                TextBodyCardInfo(
                  text: 'Total Due Amount',
                  amount: '0.0 BDT',
                ),
                TextBodyCardInfo(
                  text: 'Minimum Due',
                  amount: '0.0 BDT',
                ),
                TextBodyCardInfo(
                  text: 'Payment Due Date',
                  amount: '12/11/2023',
                )
              ],
            )),
        Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(kDefaultPadding / 2),
            height: 170,
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5, 15),
                    blurRadius: 22,
                    color: kPrimaryColor.withOpacity(0.22),
                  ),
                  BoxShadow(
                      offset: Offset(-15, -15),
                      blurRadius: 20,
                      color: Colors.white60)
                ]),
            child: Column(
              children: [
                TitleWithMoreBtn(
                  title: 'Euro',
                  press: () {},
                ),
                TextBodyCardInfo(
                  text: 'Available Credit Limit',
                  amount: '1,72,800.00 BDT',
                ),
                TextBodyCardInfo(
                  text: 'Total Due Amount',
                  amount: '0.0 BDT',
                ),
                TextBodyCardInfo(
                  text: 'Minimum Due',
                  amount: '0.0 BDT',
                ),
                TextBodyCardInfo(
                  text: 'Payment Due Date',
                  amount: '12/11/2023',
                )
              ],
            )),
      ],
    );
  }
}
