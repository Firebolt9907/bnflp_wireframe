import 'package:bnflp_wireframe/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const testMobile = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
          title: 'Bare Necessities for Life Photography',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green,
            //  brightness: MediaQuery.platformBrightnessOf(context)
             ),
            pageTransitionsTheme: PageTransitionsTheme(

              builders: {
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                defaultTargetPlatform: CupertinoPageTransitionsBuilder(),
              },
            ),
            fontFamily: "Outfit",
          ),
          routerConfig: router,
    );
  }
}
