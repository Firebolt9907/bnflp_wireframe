import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';

CarouselOptions getCarouselOptions(dynamic aspectRatio, BuildContext context) {
  return CarouselOptions(
    autoPlay: true,
    aspectRatio: aspectRatio * 1.6,
    enlargeCenterPage: true,
    viewportFraction:
        isMobile(context)
            ? 1
            : (MediaQuery.sizeOf(context).width - 50) /
                MediaQuery.sizeOf(context).width,
    enlargeFactor: isMobile(context) ? 0 : 0.2,
    enableInfiniteScroll: false,
    enlargeStrategy: CenterPageEnlargeStrategy.height,
    autoPlayAnimationDuration: Duration(milliseconds: 1200),
    autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
    autoPlayInterval: Duration(seconds: 5),
    pauseAutoPlayInFiniteScroll: false,
    pauseAutoPlayOnManualNavigate: true,
    pauseAutoPlayOnTouch: true,
  );
}
