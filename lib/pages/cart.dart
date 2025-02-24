import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:bnflp_wireframe/data/globalData.dart';
import 'package:bnflp_wireframe/widgets/footer.dart';
import 'package:bnflp_wireframe/widgets/navBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key, required this.previousPage});
  final String previousPage;

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: createNavBar(context, "Shopping Cart", false, widget.previousPage, isMobile(context)),
      child: ListView(
        children: [
          ShoppingCartItems(),
          Footer(),
        ],
      ),
    );
  }

  Widget ShoppingCartItems() {
    return ListView.builder(
      itemCount: shoppingCart.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                shoppingCart[index].imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.scaleDown,
              ),
              Column(
                children: [
                  Text(shoppingCart[index].location),
                  // Text(shoppingCart[index].price),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}