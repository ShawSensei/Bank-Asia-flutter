import 'package:bank_asia_flutter/controllers/cards_controller.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class CarouselSwiper extends StatelessWidget {
  CarouselSwiper({super.key});

  final CardsController c = Get.put(CardsController());

  @override
  Widget build(BuildContext context) {
    // Trigger function when the screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      c.fetchCardInfo();
    });

    if (c.isLoading.value) {
      // Show loading indicator while data is being fetched
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Obx(
        () => Stack(
          children: [
            Container(
              margin: EdgeInsets.all(8.0),
              child: CarouselSlider(
                items: c.cards.value.map((card) {
                  return Container(
                    padding: EdgeInsets.all(8), // Add padding here
                    child: Image.asset(
                      card.imagePath!,
                      // Access imagePath property of CardInfoModel
                      fit: BoxFit.contain, // Fit the image within the container
                    ),
                  );
                }).toList(),
                carouselController: c.buttonCarouselController.value,
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.56,
                  aspectRatio: 2.05,
                  enlargeFactor: 0.43,
                  initialPage: c.currentIndex.value,
                  // Set initial page to currentIndex
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    // Update currentIndex when page changes
                    c.currentIndex.value = index;
                  },
                ),
              ),
            ),
            Positioned(
              left: 125,
              right: 130,
              top: 90,
              bottom: 90,
              child: Container(
                decoration: BoxDecoration(color: Colors.blue),
                // Change to your desired color
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, top: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        c.cards.value[c.currentIndex.value].name!,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        c.cards.value[c.currentIndex.value].id!,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 90,
              top: 90,
              bottom: 90,
              child: Visibility(
                visible: c.currentIndex.value != 0,
                child: IconButton(
                  icon: Image.asset(
                    'assets/icons/left.png',
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () {
                    c.currentIndex.value--;
                    c.buttonCarouselController.value.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  },
                ),
              ),
            ),
            Positioned(
              right: 90,
              top: 90,
              bottom: 90,
              child: Visibility(
                visible: c.currentIndex.value != c.cards.value.length - 1,
                child: IconButton(
                  icon: Image.asset(
                    'assets/icons/right.png',
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () {
                    c.currentIndex.value++;
                    c.buttonCarouselController.value.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
