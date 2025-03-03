import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(child: Image.asset("assets/logo.png"));
  }
}