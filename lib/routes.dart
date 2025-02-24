import 'package:bnflp_wireframe/pages/aboutMe.dart';
import 'package:bnflp_wireframe/pages/cart.dart';
import 'package:bnflp_wireframe/pages/galleries.dart';
import 'package:bnflp_wireframe/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

var router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const MyHomePage(),
    routes: [
      GoRoute(
      path: '/galleries',
      builder: (context, state) =>  GalleriesPage(),
      routes: [

    GoRoute(path: "/cart", builder: (context, state) => const ShoppingCart(previousPage: "Galleries",),),
      ]
    ),
    GoRoute(path: '/aboutMe', builder: (context, state) => const AboutMe()),
    GoRoute(path: "/cart", builder: (context, state) => const ShoppingCart(previousPage: "Home",),),
    ],),
  ],
);
