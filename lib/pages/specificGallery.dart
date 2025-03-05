import 'dart:math';
import 'dart:ui';

import 'package:bnflp_wireframe/data/testData.dart';
import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:bnflp_wireframe/pages/purchasePage.dart';
import 'package:bnflp_wireframe/widgets/footer.dart';
import 'package:bnflp_wireframe/widgets/galleryCarousel.dart';
import 'package:bnflp_wireframe/widgets/galleryImage.dart';
import 'package:bnflp_wireframe/widgets/imageCarousel.dart';
import 'package:bnflp_wireframe/widgets/navBar.dart';
import 'package:bnflp_wireframe/widgets/scrollBar.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class SpecificGallery extends StatefulWidget {
  final GalleryData gallery;

  SpecificGallery({required this.gallery});

  @override
  _SpecificGalleryState createState() => _SpecificGalleryState();
}

class _SpecificGalleryState extends State<SpecificGallery> {
  late PageController pageController;
  late PageController emptyPageController;
  double scrollPos = 0;
  double imagesScrolled = 0;
  bool isTrackpadOrTouch = false;

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
    scrollPos = max(pageController.position.pixels, 0);
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
          Listener(
            onPointerSignal: (event) {
              if (event is PointerScrollEvent) {
                if (event.kind == PointerDeviceKind.trackpad ||
                    event.kind == PointerDeviceKind.touch) {
                  setState(() {
                    isTrackpadOrTouch = true;
                  });
                } else {}
              }
            },
            child: WebSmoothScroll(
              scrollAnimationLength: 400,
              scrollSpeed: 5,
              controller: pageController,
              child: scrollView(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child:
                isMobile(context)
                    ? Container()
                    : ListenableBuilder(
                      listenable: pageController,
                      builder: (context, snapshot) {
                        return Transform.translate(
                          offset: Offset(
                            (min(
                                      (widget.gallery.images.length -
                                              imagesScrolled)
                                          .abs(),
                                      1,
                                    ) -
                                    1) *
                                80,
                            0,
                          ),
                          child: BackButton(
                            onPressed: () {
                              context.pop();
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                Colors.grey.shade200,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
          ),
          ListenableBuilder(
            listenable: pageController,
            builder: (context, snapshot) {
              return Positioned(
                right: 10,
                top:
                    (MediaQuery.of(context).size.height - 270) / 2 -
                    (widget.gallery.images.length * 15) / 2,
                child: DottedScrollBar(
                  numDots: widget.gallery.images.length + 1,
                  activeDot: imagesScrolled,
                  isHorizontal: false,
                  isMobile: isMobile(context),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget scrollView() {
    return PageView.builder(
      controller: pageController,
      itemCount: widget.gallery.images.length + 1,
      scrollDirection: Axis.vertical,
      physics: isTrackpadOrTouch ? null : NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (index == widget.gallery.images.length) {
          return AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              imagesScrolled = (pageController.page ?? 0);
              return Padding(
                padding: EdgeInsets.only(
                  top:
                      (imagesScrolled - index).abs() *
                      MediaQuery.sizeOf(context).height *
                      0.7,
                ),
                child: Column(
                  spacing: isMobile(context) ? 0 : 10,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: isMobile(context) ? 10 : 0,
                      ),
                      child: Text(
                        "Check out my other galleries!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical:
                            (imagesScrolled - index).abs() *
                            MediaQuery.sizeOf(context).height *
                            0.3,
                      ),
                      child: ImageCarousel(
                        images: galleries[1].images,
                        aspectRatio:
                            MediaQuery.sizeOf(context).width /
                            (MediaQuery.sizeOf(context).height - 280),
                        parentContext: context,
                      ),
                    ),
                    Expanded(child: Footer()),
                  ],
                ),
              );
            },
          );
        }
        return AnimatedBuilder(
          animation: pageController,
          builder: (context, child) {
            imagesScrolled = (pageController.page ?? 0);
            return GalleryImage(
              parentContext: context,
              image: widget.gallery.images[index],
              imagesScrolled: imagesScrolled,
              index: index,
            );
          },
        );
      },
    );
  }
}
