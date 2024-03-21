import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSwiper extends StatefulWidget {
  @override
  _CarouselSwiperState createState() => _CarouselSwiperState();
}

class _CarouselSwiperState extends State<CarouselSwiper> {
  final CarouselController _buttonCarouselController = CarouselController();
  int _currentIndex = 2; // Initial page index
  List<String> images = [
    "assets/images/virtual_card.png",
    "assets/images/virtual_card.png",
    "assets/images/virtual_card.png",
    "assets/images/virtual_card.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(8.0),
          child: CarouselSlider(
            items: images.map((image) {
              return Container(
                padding: EdgeInsets.all(8), // Add padding here
                child: Image.asset(
                  image,
                  fit: BoxFit.contain, // Fit the image within the container
                ),
              );
            }).toList(),
            carouselController: _buttonCarouselController,
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.56,
              aspectRatio: 2.05,
              enlargeFactor: 0.43,
              initialPage: 2,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          left: 90,
          top: 20,
          bottom: 20,
          child: Visibility(
            visible: _currentIndex != 0,
            child: IconButton(
              icon: Image.asset(
                'assets/icons/left.png',
                width: 30,
                height: 30,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex--;
                });
                _buttonCarouselController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              },
            ),
          ),
        ),
        Positioned(
          right: 90,
          top: 10,
          bottom: 10,
          child: Visibility(
            visible: _currentIndex != images.length - 1,
            child: IconButton(
              icon: Image.asset(
                'assets/icons/right.png',
                width: 30,
                height: 30,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex++;
                });
                _buttonCarouselController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
