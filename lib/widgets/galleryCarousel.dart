import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:bnflp_wireframe/data/testData.dart';
import 'package:bnflp_wireframe/pages/galleries.dart';
import 'package:bnflp_wireframe/pages/purchasePage.dart';
import 'package:bnflp_wireframe/pages/specificGallery.dart';
import 'package:bnflp_wireframe/widgets/carouselButtons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GalleryCarousel extends StatefulWidget {
  final GalleryData gallery;
  final double aspectRatio;
  final BuildContext parentContext;

  const GalleryCarousel({
    super.key,
    required this.gallery,
    required this.aspectRatio,
    required this.parentContext,
  });

  @override
  State<GalleryCarousel> createState() => _GalleryCarouselState();
}

class _GalleryCarouselState extends State<GalleryCarousel> {
  CarouselSliderController carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Text(
                    widget.gallery.galleryName,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 50,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: TextButton(onPressed: () {
                    Navigator.push(
                      widget.parentContext,
                      CupertinoPageRoute(
                        builder: (context) {
                          return SpecificGallery(
                            gallery: widget.gallery,
                          );
                        },
                      ),
                    );
                  }, child: Text("View All"), style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Theme.of(context).hintColor.withAlpha(30))),),
                )
              ],
            ),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                CarouselSlider.builder(
                  itemCount: widget.gallery.images.length,
                  itemBuilder: (context, index, index1) {
                    return Padding(
                      padding: EdgeInsets.all(
                        isMobile(widget.parentContext) ? 0 : 10,
                      ),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                widget.parentContext,
                                CupertinoPageRoute(
                                  builder: (context) {
                                    return PurchasePage(
                                      image:
                                          widget.gallery.images[index],
                                    );
                                  },
                                ),
                              );
                            },
                            child: Hero(
                              transitionOnUserGestures: true,
                              tag: widget.gallery.images[index].imagePath,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  isMobile(widget.parentContext) ? 0 : 20,
                                ),
                                child: AspectRatio(
                                  aspectRatio: widget.aspectRatio * 2,
                                  child: Image.asset(
                                    isWireframe ? "assets/verticalPlaceholder.png" : widget.gallery.images[index].imagePath,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
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
                    viewportFraction:
                        isMobile(widget.parentContext)
                            ? 1
                            : (MediaQuery.sizeOf(context).width - 50) /
                                MediaQuery.sizeOf(context).width,
                    enlargeFactor: isMobile(context) ? 0 : 0.2,
                    enableInfiniteScroll: false,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    autoPlayAnimationDuration: Duration(
                      milliseconds: (widget.aspectRatio * 800).toInt(),
                    ),
                    pauseAutoPlayInFiniteScroll: false,
                    pauseAutoPlayOnManualNavigate: true,
                    pauseAutoPlayOnTouch: true,
                  ),
                  carouselController: carouselController,
                ),
                PreviousImageButton(carouselController: carouselController),
                NextImageButton(carouselController: carouselController),
              ],
            ),
          ],
        );
      },
    );
  }
}
