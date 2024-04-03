import 'package:bank_asia_flutter/components/parallax_swiper.dart';
import 'package:bank_asia_flutter/constants/ui_constants.dart';
import 'package:bank_asia_flutter/controllers/homepage_controller.dart';
import 'package:bank_asia_flutter/utils/carousel_swiper.dart';
import 'package:bank_asia_flutter/utils/custom_app_bar.dart';
import 'package:bank_asia_flutter/utils/parallax_swiper_page.dart';
import 'package:bank_asia_flutter/utils/tab_bar_view.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/instance_manager.dart';

import '../../utils/fragment_view.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final MyHomePageController c = Get.put(MyHomePageController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(title: 'Credit Card information'),
      body: Column(
        children: [
          Container(
              // margin: EdgeInsets.all(kDefaultPadding / 2),
              // width: size.width * 0.65,
              height: size.height * 0.25,
              child: CarouselSwiper()
              //Image.asset("assets/images/virtual_card.png"),
              ),
          // Container(
          //   margin: EdgeInsets.only(
          //     left: kDefaultPadding,
          //     top: kDefaultPadding / 2,
          //     bottom: kDefaultPadding / 2,
          //     right: kDefaultPadding,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Expanded(
          //         flex: 1,
          //         child: MaterialButton(
          //           onPressed: () {},
          //           child: Text("Card Info"),
          //           color: kPrimaryColor,
          //         ),
          //       ),
          //       Expanded(
          //         flex: 2,
          //         child: Container(
          //           margin:
          //               EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          //           child: MaterialButton(
          //             onPressed: () {},
          //             child: Text("Last 10 Transaction"),
          //             color: kPrimaryColor,
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         flex: 1,
          //         child: MaterialButton(
          //           onPressed: () {},
          //           child: Text("Statement"),
          //           color: kPrimaryColor,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          FragmentView(),
          // CustomTabBar(),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Container(
          //       margin: EdgeInsets.all(10),
          //       height: 200,
          //       width: 560,
          //       decoration: BoxDecoration(color: Colors.blue),
          //     ),
          //     Container(
          //       margin: EdgeInsets.all(10),
          //       height: 200,
          //       width: 560,
          //       decoration: BoxDecoration(color: Colors.blue),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
