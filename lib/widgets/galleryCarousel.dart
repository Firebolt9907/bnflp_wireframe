import 'package:bnflp_wireframe/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class GalleryCarousel extends StatefulWidget {
  final GalleryData gallery;
  final CarouselSliderController? carouselController;
  final double aspectRatio;
  final BuildContext parentContext;
  final bool? isFirst;

  const GalleryCarousel({
    super.key,
    required this.gallery,
    this.carouselController,
    required this.aspectRatio,
    required this.parentContext,
    this.isFirst,
  });

  @override
  State<GalleryCarousel> createState() => _GalleryCarouselState();
}

class _GalleryCarouselState extends State<GalleryCarousel> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.only(top: widget.isFirst == true ? 60 : 0),
          child: CarouselSlider.builder(
            itemCount: widget.gallery.images.length,
            itemBuilder: (context, index, index1) {
              return Padding(
                padding: EdgeInsets.all(isMobile(constraints) ? 0 : 10),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        isMobile(constraints) ? 0 : 20,
                      ),
                      child: AspectRatio(
                        aspectRatio: widget.aspectRatio * 2,
                        child: Image.asset(
                          widget.gallery.images[index].imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Text(
                        "${widget.gallery.galleryName} - ${widget.gallery.images[index].location}",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: widget.aspectRatio * 2,
              enlargeCenterPage: true,
              viewportFraction: 1,
              enlargeFactor: 0,
              enableInfiniteScroll: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              autoPlayAnimationDuration: Duration(
                milliseconds: (widget.aspectRatio * 800).toInt(),
              ),
              pauseAutoPlayInFiniteScroll: false,
              pauseAutoPlayOnManualNavigate: false,
              pauseAutoPlayOnTouch: false,
            ),
            carouselController: widget.carouselController,
          ),
        );
      },
    );
  }
}
