import 'package:flutter/material.dart';

class ItemSizeWidget extends StatefulWidget {
  const ItemSizeWidget({super.key});

  @override
  State<ItemSizeWidget> createState() => _ItemSizeWidgetState();
}

class _ItemSizeWidgetState extends State<ItemSizeWidget> {
  bool isNoramlSelected = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Size',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Row(
            children: [
              InkWell(
                onTap: () => setState(() {
                  isNoramlSelected = true;
                }),
                child: SizeWidget(
                  iconSize: 14,
                  title: 'Normal',
                  isSelected: isNoramlSelected,
                ),
              ),
              InkWell(
                onTap: () => setState(() {
                  isNoramlSelected = false;
                }),
                child: SizeWidget(
                  iconSize: 20,
                  title: 'Large',
                  isSelected: !isNoramlSelected,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SizeWidget extends StatelessWidget {
  final double iconSize;
  final String title;
  final bool isSelected;
  const SizeWidget(
      {super.key,
      required this.iconSize,
      required this.title,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[200] : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.transparent,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.rice_bowl_sharp,
                  size: iconSize,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(title)
              ],
            )),
      ),
    );
  }
}
