import 'package:bnflp_wireframe/main.dart';
import 'package:bnflp_wireframe/widgets/aboutMeBlurb.dart';
import 'package:bnflp_wireframe/widgets/galleryCarousel.dart';
import 'package:bnflp_wireframe/widgets/imageCarousel.dart';
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
  List<GalleryData> galleries = [
    GalleryData(
      url: 'local',
      images: [
        ImageData(
          imagePath: 'assets/1.jpg',
          caption: "Morning Full Moon Reflection",
          location: "Sugar Creek",
        ),
        ImageData(
          imagePath: 'assets/3.jpg',
          caption: "Frozen Pond Sunrise",
          location: "Sugar Creek",
        ),
      ],
      galleryName: "Local",
    ),
    GalleryData(
      url: 'colorado',
      images: [
        ImageData(
          imagePath: 'assets/4.jpg',
          caption: "A morning view of Pikes Peak from Garden of the Gods",
          location: "Garden of the Gods",
        ),
        ImageData(
          imagePath: 'assets/2.jpg',
          caption:
              "Bishop Castle in Rye, CO allows visitors to explore at their own risk and provides you an experience you will never forget.",
          location: "Bishop Castle",
        ),
      ],
      galleryName: "Colorado",
    ),
  ];
  CarouselSliderController carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    double aspectRatio =
        MediaQuery.sizeOf(context).width / MediaQuery.sizeOf(context).height;
    return CupertinoPageScaffold(
      navigationBar: createNavBar(context, "Galleries", false),

      child: ListView.builder(
        itemCount: galleries.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: GalleryCarousel(
              gallery: galleries[index],
              carouselController: carouselController,
              aspectRatio: aspectRatio,
              parentContext: context,
              isFirst: index == 0,
            ),
            onTap: () {
              context.go('/galleries/${galleries[index].url}');
            },
          );
        },
      ),
    );
  }
}
