import 'package:flutter/material.dart';
import 'package:food_delivery/home_screen/pages/widgets/dots_indicator.dart';

class ItemImageCourrosal extends StatefulWidget {
  const ItemImageCourrosal({Key? key}) : super(key: key);

  @override
  State<ItemImageCourrosal> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<ItemImageCourrosal> {
  int _currentIndex = 0;

  final _pageViewController =
      PageController(initialPage: 0, viewportFraction: 0.75);

  final myImagesList = [
    'assets/images/salad.jpg',
    'assets/images/salad.jpg',
    'assets/images/salad.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
              controller: _pageViewController,
              itemCount: myImagesList.length,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final images = myImagesList[index];
                var scale = _currentIndex == index ? 1.0 : 0.8;
                return TweenAnimationBuilder(
                    tween: Tween(begin: scale, end: scale),
                    duration: const Duration(milliseconds: 350),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(60),
                        image: DecorationImage(
                          image: AssetImage(images),
                        ),
                      ),
                    ),
                    builder: (context, double value, child) {
                      return Transform.scale(
                        scale: value,
                        child: child,
                      );
                    });
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: DotsIndicator(
            length: myImagesList.length,
            index: _currentIndex,
          ),
        )
      ],
    );
  }
}
