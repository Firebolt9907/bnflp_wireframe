import 'package:bnflp_wireframe/data/testData.dart';
import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:bnflp_wireframe/pages/purchasePage.dart';
import 'package:bnflp_wireframe/widgets/footer.dart';
import 'package:bnflp_wireframe/widgets/galleryCarousel.dart';
import 'package:bnflp_wireframe/widgets/galleryImage.dart';
import 'package:bnflp_wireframe/widgets/navBar.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpecificGallery extends StatefulWidget {
  final GalleryData gallery;

  SpecificGallery({required this.gallery});

  @override
  _SpecificGalleryState createState() => _SpecificGalleryState();
}

class _SpecificGalleryState extends State<SpecificGallery> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    print(pageController.position.pixels);
    if (pageController.position.atEdge) {
      bool isTop = pageController.position.pixels == 0;
      if (isTop) {
        print('Scrolled to the top');
      } else {
        print('Scrolled to the bottom');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createNavBar(
        context,
        "${widget.gallery.galleryName} Gallery",
        false,
        "Home",
        isMobile(context),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: widget.gallery.images.length + 1,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              if (index == widget.gallery.images.length) {
                return Footer();
              }
              return AnimatedBuilder(
                animation: pageController,
                builder: (context, child) {
                  double imagesScrolled = (pageController.page ?? 0);
                  double scale = 0.7 + 0.3 * (1 - (index - imagesScrolled).abs());
                  return Transform.scale(
                    scale: scale,
                    child: GalleryImage(parentContext: context, image: widget.gallery.images[index])
                  );
                },
              );
            },
          ),
          Padding(
          padding: const EdgeInsets.all(20),
          child: isMobile(context) ? Container() : BackButton(
            onPressed: () {
              context.pop();
            },
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.grey.shade200)),
          ),
                  ),
        ],
      ),
    );
  }
}
