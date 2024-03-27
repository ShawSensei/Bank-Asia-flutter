import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

import '../components/card_list.dart';
import '../models/card_model.dart';

class CardsController extends GetxController {
  var buttonCarouselController = CarouselController().obs;
  var currentIndex = 0.obs;
  var isLoading = true.obs;
  var cards = <CardInfoModel>[].obs;

  void fetchCardInfo() async {
    try {
      List<CardInfoModel> fetchedCards = await CardList.fetchCardInfo();
      cards.value = fetchedCards;
      isLoading.value = false;
    } catch (e) {
      print('Failed to fetch card info: $e');
      // Handle error here
    }
  }
}
