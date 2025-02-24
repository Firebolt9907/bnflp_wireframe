import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:bnflp_wireframe/data/globalData.dart';
import 'package:bnflp_wireframe/widgets/navBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({super.key, required this.image});
  final ImageData image;

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: createNavBar(
        context,
        widget.image.location,
        false,
        "Galleries",
        isMobile(context),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (isMobile(context)) {
            return ListView(children: [LargeImage(true), PurchaseWindow(true)]);
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [LargeImage(false), PurchaseWindow(false)],
          );
        },
      ),
    );
  }

  Widget LargeImage(bool isMobile) {
    return SizedBox(
      width: isMobile ? null : MediaQuery.sizeOf(context).width * 2 / 3,
      child: Center(
        child: Hero(
          transitionOnUserGestures: true,
          tag: widget.image.imagePath,
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: isMobile ? 20 : 10,
              top: 60,
              bottom: 20,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(widget.image.imagePath, fit: BoxFit.scaleDown),
            ),
          ),
        ),
      ),
    );
  }

  Widget PurchaseWindow(bool isMobile) {
    return SizedBox(
      height: isMobile ? null : MediaQuery.sizeOf(context).height,
      width:
          isMobile
              ? MediaQuery.sizeOf(context).width
              : MediaQuery.sizeOf(context).width / 3,
      child: Padding(
        padding: EdgeInsets.only(
          top: isMobile ? 10 : 60,
          right: 20,
          left: isMobile ? 20 : 10,
          bottom: 20,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: const Color.fromARGB(109, 132, 132, 132),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                spacing: 20,
                children: [
                  Text(
                    '"${widget.image.caption}"',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        shoppingCart.add(widget.image);
                        context.pushReplacement("/galleries/cart");
                      },
                      child: Text(
                        "Add to Cart",
                        softWrap: false,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.yellow),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Buy Now (WIP)",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.orange),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
