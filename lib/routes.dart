import 'package:bnflp_wireframe/galleries.dart';
import 'package:bnflp_wireframe/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const MyHomePage()),
    GoRoute(
      path: '/galleries',
      builder: (context, state) => const GalleriesPage(),
    ),
    GoRoute(
      path: '/test',
      builder: (context, state) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text('Test Page')),
          child: Center(
            child: Container(
              color: CupertinoColors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Test'),
                  CupertinoButton(
                    child: Text('Close'),
                    onPressed: () {
                      context.go("/");
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  ],
);
