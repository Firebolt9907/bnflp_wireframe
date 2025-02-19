import 'package:bnflp_wireframe/main.dart';
import 'package:bnflp_wireframe/widgets/aboutMeBlurb.dart';
import 'package:bnflp_wireframe/widgets/carousel.dart';
import 'package:bnflp_wireframe/widgets/navBar.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GalleriesPage extends StatefulWidget {
  const GalleriesPage({super.key});

  @override
  State<GalleriesPage> createState() => _GalleriesPageState();
}

class _GalleriesPageState extends State<GalleriesPage> {
  List<ImageData> images = [
    ImageData(
      imagePath: 'assets/1.jpg',
      caption: "Morning Full Moon Reflection",
      location: "Sugar Creek",
    ),
    ImageData(
      imagePath: 'assets/2.jpg',
      caption:
          "Bishop Castle in Rye, CO allows visitors to explore at their own risk and provides you an experience you will never forget.",
      location: "Bishop Castle",
    ),
    ImageData(
      imagePath: 'assets/3.jpg',
      caption: "Frozen Pond Sunrise",
      location: "Sugar Creek",
    ),
    ImageData(
      imagePath: 'assets/4.jpg',
      caption: "A morning view of Pikes Peak from Garden of the Gods",
      location: "Garden of the Gods",
    ),
  ];
  CarouselSliderController carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    double aspectRatio =
        MediaQuery.sizeOf(context).width / MediaQuery.sizeOf(context).height;
    return CupertinoPageScaffold(
      navigationBar: createNavBar(context),

      child: ListView(
        children: [
          GestureDetector(
            child: Carousel(
              images: images,
              carouselController: carouselController,
              aspectRatio: aspectRatio,
              parentContext: context,
            ),
            onTap: () {
              context.go('/galleries');
            },
          ),
        ],
      ),
    );
  }
}
