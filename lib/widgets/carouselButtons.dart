import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreviousImageButton extends StatelessWidget {
  const PreviousImageButton({super.key, required this.carouselController});
  final CarouselSliderController carouselController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: isMobile(context) ? 10 : 50),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10e6),
          child: Container(
            color: const Color.fromARGB(99, 255, 255, 255),
            child: IconButton(
              icon: Icon(CupertinoIcons.chevron_left),
              onPressed: () {
                carouselController.previousPage();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class NextImageButton extends StatelessWidget {
  const NextImageButton({super.key, required this.carouselController});
  final CarouselSliderController carouselController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: isMobile(context) ? 10 : 50),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10e6),
          child: Container(
            color: const Color.fromARGB(99, 255, 255, 255),
            child: IconButton(
              icon: Icon(CupertinoIcons.chevron_right),
              onPressed: () {
                carouselController.nextPage();
              },
            ),
          ),
        ),
      ),
    );
  }
}
