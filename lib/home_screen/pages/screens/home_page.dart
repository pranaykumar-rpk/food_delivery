import 'package:flutter/material.dart';
import 'package:food_delivery/home_screen/pages/widgets/address_and_search_bar.dart';
import 'package:food_delivery/home_screen/pages/widgets/favorite_menu_section.dart';
import 'package:food_delivery/home_screen/pages/widgets/food_details_section.dart';
import 'package:food_delivery/home_screen/pages/widgets/food_items_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndexIcon = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, 0),
            end: Alignment(1, -1),
            stops: [0, 0.6, 1],
            colors: [
              Color(0xfff9f9f9),
              Color(0xfff9f9f9),
              Color.fromARGB(255, 248, 195, 164),
            ],
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: Container(
              color: Colors.white,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndexIcon = 0;
                        });
                      },
                      child: CommonBottomBarIcon(
                          icon: Icons.home_filled,
                          isSelected: selectedIndexIcon == 0),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndexIcon = 1;
                        });
                      },
                      child: CommonBottomBarIcon(
                          icon: Icons.favorite_border,
                          isSelected: selectedIndexIcon == 1),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndexIcon = 2;
                        });
                      },
                      child: CommonBottomBarIcon(
                          icon: Icons.notification_important_sharp,
                          isSelected: selectedIndexIcon == 2),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndexIcon = 3;
                        });
                      },
                      child: CommonBottomBarIcon(
                          icon: Icons.person_outline,
                          isSelected: selectedIndexIcon == 3),
                    ),
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: const [
                  AddressAndSearchBarSection(),
                  FoodItemsSection(),
                  FoodDetailsSection(),
                  FavoriteMenuSection(),
                ],
              ),
            )),
      ),
    );
  }
}

class CommonBottomBarIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  const CommonBottomBarIcon(
      {super.key, required this.icon, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 30,
          color: isSelected ? const Color(0xffed714d) : Colors.grey,
        ),
        if (isSelected)
          Container(
            height: 5,
            width: 5,
            decoration: const BoxDecoration(
              color: Color(0xffed714d),
              shape: BoxShape.circle,
            ),
          )
      ],
    );
  }
}
