import 'package:flutter/material.dart';

class DottedScrollBar extends StatefulWidget {
  const DottedScrollBar({super.key, required this.numDots, required this.activeDot, required this.isHorizontal});
  final int numDots;
  final double activeDot;
  final bool isHorizontal;

  @override
  State<DottedScrollBar> createState() => _DottedScrollBarState();
}

class _DottedScrollBarState extends State<DottedScrollBar> {
  @override
  Widget build(BuildContext context) {
    if (widget.isHorizontal) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.numDots, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: widget.activeDot.round() == index ? Colors.white : Colors.white.withAlpha(150),
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.numDots, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 3),
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: widget.activeDot.round() == index ? Colors.white : Colors.white.withAlpha(150),
                shape: BoxShape.circle,
              ),
            ),
          );
        }),
      );
    }
  }
}