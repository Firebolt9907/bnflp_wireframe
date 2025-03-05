import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class ScrollableList extends StatefulWidget {
  const ScrollableList({super.key, required this.children, this.controller});
  final List<Widget> children;
  final ScrollController? controller;

  @override
  State<ScrollableList> createState() => _ScrollableListState();
}

class _ScrollableListState extends State<ScrollableList> {
  bool isTrackpadOrTouch = false;
  late ScrollController pageController;

  @override
  void initState() {
    super.initState();
    pageController = widget.controller ?? ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
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
        scrollAnimationLength: 300,
        controller: pageController,
        child: ListView(
          controller: pageController,
          physics: isTrackpadOrTouch ? null : NeverScrollableScrollPhysics(),
          children: widget.children,
        ),
      ),
    );
  }
}

class ScrollableListBuilder extends StatefulWidget {
  const ScrollableListBuilder({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.controller,
  });
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final ScrollController? controller;

  @override
  State<ScrollableListBuilder> createState() => _ScrollableListBuilderState();
}

class _ScrollableListBuilderState extends State<ScrollableListBuilder> {
  bool isTrackpadOrTouch = false;
  late ScrollController pageController;

  @override
  void initState() {
    super.initState();
    pageController = widget.controller ?? ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
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
        scrollAnimationLength: 300,
        controller: pageController,
        child: ListView.builder(
          controller: pageController,
          physics: isTrackpadOrTouch ? null : NeverScrollableScrollPhysics(),
          itemCount: widget.itemCount,
          itemBuilder: widget.itemBuilder,
        ),
      ),
    );
  }
}
