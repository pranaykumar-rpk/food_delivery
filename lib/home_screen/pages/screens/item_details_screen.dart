import 'package:flutter/material.dart';
import 'package:food_delivery/home_screen/pages/widgets/add_to_cart_section.dart';
import 'package:food_delivery/home_screen/pages/widgets/item_image_courrosal.dart';
import 'package:food_delivery/home_screen/pages/widgets/item_name_and_description.dart';
import 'package:food_delivery/home_screen/pages/widgets/item_size_widget.dart';


class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, 0),
            end: Alignment(1, -1),
            stops: [0, 0.5, 1],
            colors: [
              Color(0xfff9f9f9),
              Color(0xfff9f9f9),
              Color.fromARGB(255, 248, 195, 164),
            ],
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: const AddToCartSection(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                  ),
                  const ItemImageCourrosal(),
                  const SizedBox(
                    height: 20,
                  ),
                  const ItemNameAndDescription(),
                  const SizedBox(
                    height: 20,
                  ),
                  const ItemSizeWidget(),
                ],
              ),
            )),
      ),
    );
  }
}
