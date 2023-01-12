import 'package:flutter/material.dart';

class FoodItemsSection extends StatefulWidget {
  const FoodItemsSection({super.key});

  @override
  State<FoodItemsSection> createState() => _FoodItemsSectionState();
}

class _FoodItemsSectionState extends State<FoodItemsSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
            },
            child: FoodItem(
                title: 'Salad',
                imagePath: 'assets/icons/salad.png',
                isSelected: selectedIndex == 0),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
            },
            child: FoodItem(
              title: 'Pizza',
              imagePath: 'assets/icons/pizza.png',
              isSelected: selectedIndex == 1,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedIndex = 2;
              });
            },
            child: FoodItem(
              title: 'Burger',
              imagePath: 'assets/icons/burger.png',
              isSelected: selectedIndex == 2,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedIndex = 3;
              });
            },
            child: FoodItem(
              title: 'Boba Shake',
              imagePath: 'assets/icons/milkshake.png',
              isSelected: selectedIndex == 3,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedIndex = 4;
              });
            },
            child: FoodItem(
              title: 'Boba Shake',
              imagePath: 'assets/icons/milkshake.png',
              isSelected: selectedIndex == 4,
            ),
          ),
        ],
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isSelected;
  const FoodItem(
      {super.key,
      required this.title,
      required this.imagePath,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: isSelected ? const Color(0xffed7e46) : Colors.white,
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                height: 20,
                width: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
