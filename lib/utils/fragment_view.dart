import 'package:bank_asia_flutter/controllers/cards_controller.dart';
import 'package:bank_asia_flutter/models/card_model.dart';
import 'package:bank_asia_flutter/responseModels/card_info_res_model.dart';
import 'package:bank_asia_flutter/utils/text_body_card_info.dart';
import 'package:bank_asia_flutter/utils/title_with_btn.dart';
import 'package:bank_asia_flutter/utils/transaction_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/ui_constants.dart';
import '../controllers/homepage_controller.dart';
import '../screens/details/card_info_fragment.dart';
import '../screens/details/last_10_transaction_fragment.dart';
import '../screens/details/statement_fragment.dart';

class FragmentView extends StatelessWidget {
  final MyHomePageController homepageController = Get.put(MyHomePageController());
  final CardsController cardsController = Get.put(CardsController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // subtracting top padding

    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding / 2,
        right: kDefaultPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 3,
                  child: buildButton(0, "Card Info"),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                    child: buildButton(1, "Last 10 Transaction"),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: buildButton(2, "Statement"),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: SizedBox(
              height: size.height * 0.52,
              child: Obx(
                () => IndexedStack(
                  index: homepageController.currentIndex.value,
                  children: [
                    CardInfoFragment(
                      cardInfo: cardsController.cardInfo.value,
                      //cardInfo: CardInfoResModel(),
                    ),
                    Last10TransactionFragment(
                      date: cardsController.last10Transaction.value.paymentDueDate!,
                      id: cardsController.cardInfo.value.accountNo!,
                      amount: cardsController.last10Transaction.value.minPaymentBDTS!,
                    ),
                    StatementFragment(
                      clientId: cardsController.cardInfo.value.accountNo!,
                      statementDate: cardsController.statement.value.nextStatementDate!!,
                      paymentDate: cardsController.statement.value.minPaymentBDTS!,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(int index, String text) {
    Color colo = index == homepageController.currentIndex.value ? kPrimaryColor : Colors.white;
    Color texColo = index == homepageController.currentIndex.value ? Colors.white : Colors.black87;

    return MaterialButton(
      onPressed: () => homepageController.changeView(index),
      child: Text(text),
      textColor: texColo,
      color: colo,
    );
  }
}
