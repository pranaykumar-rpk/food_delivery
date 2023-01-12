import 'package:flutter/material.dart';
import 'package:food_delivery/home_screen/pages/screens/item_details_screen.dart';
import 'package:food_delivery/home_screen/pages/widgets/common_rating_bar.dart';
import 'package:food_delivery/home_screen/pages/widgets/distance_and_delivery_time_widget.dart';

class FoodDetailsSection extends StatelessWidget {
  const FoodDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Popular food',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                'See all',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        const SizedBox(height: 40),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            shrinkWrap: true,
            children: const [
              FoodThumbnail(
                imagePath: 'assets/images/salad.jpg',
                title: 'Salad with Shirata',
                estimatedDeliveryTimeInMins: 10,
                distanceInKms: 1,
                circleAvatarDescription: '14K',
                rating: 4,
              ),
              FoodThumbnail(
                imagePath: 'assets/images/salad.jpg',
                title: 'Salado Beef Wagyu',
                estimatedDeliveryTimeInMins: 10,
                distanceInKms: 1,
                circleAvatarDescription: '10K',
                rating: 5,
              ),
              FoodThumbnail(
                imagePath: 'assets/images/salad.jpg',
                title: 'Salad with Shirata',
                estimatedDeliveryTimeInMins: 10,
                distanceInKms: 1,
                circleAvatarDescription: '14K',
                rating: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FoodThumbnail extends StatelessWidget {
  final String imagePath;
  final String title;
  final int estimatedDeliveryTimeInMins;
  final double distanceInKms;
  final String circleAvatarDescription;
  final double rating;
  const FoodThumbnail(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.estimatedDeliveryTimeInMins,
      required this.distanceInKms,
      required this.circleAvatarDescription,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return const ItemDetailsScreen();
            },
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = const Offset(1.0, 0.0);
              var end = Offset.zero;
              var curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 175,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CommonRatingBar(rating: rating, title: '$rating'),
                    const SizedBox(
                      height: 10,
                    ),
                    DistanceAndDeliveryTimeWidget(
                        distanceInKms: distanceInKms,
                        estimatedDeliveryTimeInMins:
                            estimatedDeliveryTimeInMins),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -30,
              left: 0,
              right: 0,
              child: Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(imagePath),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xffed7e46)),
                          child: Center(
                              child: Text(circleAvatarDescription,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)))),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
