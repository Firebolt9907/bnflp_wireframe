import 'package:bnflp_wireframe/data/dataTypes.dart';
import 'package:bnflp_wireframe/data/globalData.dart';
import 'package:bnflp_wireframe/data/testData.dart';
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
    return Scaffold(
      appBar: createNavBar(
        context,
        widget.image.location,
        false,
        "Galleries",
        isMobile(context),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (isMobile(context)) {
            return ListView(children: [LargeImage(context), PurchaseWindow(true)]);
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [LargeImage(context), PurchaseWindow(false)],
          );
        },
      ),
    );
  }

  Widget LargeImage(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: isMobile(context) ? null : MediaQuery.sizeOf(context).width * 2 / 3,
          height: MediaQuery.sizeOf(context).width > 550 && isMobile(context) ? MediaQuery.sizeOf(context).height * 2/3 : null,
          child: Center(
            child: Hero(
              transitionOnUserGestures: true,
              tag: widget.image.imagePath,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: isMobile(context) ? 20 : 10,
                  top: 0,
                  bottom: 10,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(isWireframe ? "assets/verticalPlaceholder.png" : widget.image.imagePath, fit: BoxFit.scaleDown),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: isMobile(context) ? Container() : BackButton(
            onPressed: () {
              context.pop();
            },
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.grey.shade200)),
          ),
        ),
      ],
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
          top: isMobile ? 10 : 0,
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
              child: isMobile ? Column(children: PurchaseWidgets()) : ListView(children: PurchaseWidgets()
                ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> PurchaseWidgets() {
    return [
    Hero(
      tag: widget.image.imagePath+"caption",
      child: Text(
        '"${widget.image.caption}"',
        style: Theme.of(
          context,
        ).textTheme.displaySmall!.copyWith(fontStyle: FontStyle.italic),
        textAlign: TextAlign.left,
      ),
    ),
    Text(
      "\$12.99",
      style: Theme.of(context).textTheme.displaySmall,
      textAlign: TextAlign.left,
    ),
    Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 20),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            shoppingCart.add(
              CartItemData(1, image: widget.image, price: 12.99),
            );
            context.pushReplacement("/galleries/cart");
          },
          child: Text(
            "Add to Cart",
            softWrap: false,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black, fontSize: 20),
          ),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.yellow),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
          style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black, fontSize: 20),
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.orange),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ),
    ),
  ];}
}
