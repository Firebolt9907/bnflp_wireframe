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
    return Scaffold(
      appBar: createNavBar(context, "Shopping Cart", false, widget.previousPage, isMobile(context)),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ShoppingCartItems(),
              ],
            ),
          ),
          SizedBox(width: double.infinity, child: Footer())
        ],
      ),
    );
  }

  Widget ShoppingCartItems() {
    return shoppingCart.length != 0 ? ListView.builder(
      itemCount: shoppingCart.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        shoppingCart[index].image.imagePath,
                        height: 150,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(shoppingCart[index].image.location, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 50)),  
                      Text("Quantity: " + shoppingCart[index].quantity.toString(), style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 30)),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text("\$${shoppingCart[index].price}", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 40)),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: IconButton(
                      icon: Icon(CupertinoIcons.trash),
                      onPressed: () {
                        setState(() {
                          shoppingCart.removeAt(index);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ) : Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text("Your shopping cart is empty.", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 50)),
    );
  }
}