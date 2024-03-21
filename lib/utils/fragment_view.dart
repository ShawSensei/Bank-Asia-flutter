import 'package:bank_asia_flutter/utils/text_body_card_info.dart';
import 'package:bank_asia_flutter/utils/title_with_btn.dart';
import 'package:bank_asia_flutter/utils/transaction_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controllers/homepage_controller.dart';
import '../screens/details/card_info_fragment.dart';
import '../screens/details/last_10_transaction_fragment.dart';
import '../screens/details/statement_fragment.dart';
import 'cards_from_card_info.dart';

class FragmentView extends StatelessWidget {
  final MyHomePageController controller = Get.put(MyHomePageController());

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
                    margin:
                        EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
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
                  index: controller.currentIndex.value,
                  children: [
                    CardInfoFragment(),
                    Last10TransactionFragment(),
                    StatementFragment(),
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
    Color colo =
        index == controller.currentIndex.value ? kPrimaryColor : Colors.white;
    Color texColo =
        index == controller.currentIndex.value ? Colors.white : Colors.black87;

    return MaterialButton(
      onPressed: () => controller.changeView(index),
      child: Text(text),
      textColor: texColo,
      color: colo,
    );
  }
}
