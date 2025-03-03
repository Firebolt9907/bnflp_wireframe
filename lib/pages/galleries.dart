import 'package:bnflp_wireframe/data/testData.dart';
import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:bnflp_wireframe/widgets/footer.dart';
import 'package:bnflp_wireframe/widgets/galleryCarousel.dart';
import 'package:bnflp_wireframe/widgets/navBar.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GalleriesPage extends StatefulWidget {
  const GalleriesPage({super.key});

  @override
  State<GalleriesPage> createState() => _GalleriesPageState();
}

class _GalleriesPageState extends State<GalleriesPage> {
  CarouselSliderController carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    double aspectRatio =
        MediaQuery.sizeOf(context).width / MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: createNavBar(context, "Galleries", false, "Home", isMobile(context)),

      body: ListView.builder(
        itemCount: galleries.length + 1,
        // padding: EdgeInsets.only(top: isMobile(context) ? 90 : 40),
        itemBuilder: (context, index) {
          if (index == galleries.length) {
            return Footer();
          }
          return GalleryCarousel(
            gallery: galleries[index],
            aspectRatio: aspectRatio,
            parentContext: context,
          );
        },
      ),
    );
  }
}