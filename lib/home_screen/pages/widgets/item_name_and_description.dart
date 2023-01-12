import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/home_screen/pages/widgets/common_rating_bar.dart';
import 'package:food_delivery/home_screen/pages/widgets/distance_and_delivery_time_widget.dart';

class ItemNameAndDescription extends StatefulWidget {
  const ItemNameAndDescription({super.key});

  @override
  State<ItemNameAndDescription> createState() => _ItemNameAndDescriptionState();
}

class _ItemNameAndDescriptionState extends State<ItemNameAndDescription> {
  final String description =
      'The flavor of salad with shirataki taste much like vegetable and regular pastha they are very neutral, and will take on the flavour The flavor of salad with shirataki taste much like vegetable and regular pastha they are very neutral, and will take on the flavour The flavor of salad with shirataki taste much like vegetable and regular pastha they are very neutral, and will take on the flavour';
  bool shouldShowExpandableText = false;
  bool readMore = false;
  @override
  void initState() {
    if (description.length > 150) {
      shouldShowExpandableText = true;
      readMore = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DistanceAndDeliveryTimeWidget(
              distanceInKms: 2, estimatedDeliveryTimeInMins: 10),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Salad With Shirataki',
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const CommonRatingBar(rating: 4, title: '4.0 Rating', itemSize: 20),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Builder(builder: ((context) {
            if (shouldShowExpandableText && readMore) {
              return RichText(
                  text: TextSpan(
                      text: description.substring(0, 131),
                      style: const TextStyle(
                          color: Colors.grey,
                          height: 1.5,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      children: [
                    TextSpan(
                        text: ' Read More...',
                        style:
                            const TextStyle(color: Colors.orange, fontSize: 14),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              readMore = false;
                            });
                          })
                  ]));
            } else if (shouldShowExpandableText && !readMore) {
              return RichText(
                  text: TextSpan(
                      text: description,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      children: [
                    TextSpan(
                        text: '...Read less',
                        style: const TextStyle(color: Colors.orange),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              readMore = true;
                            });
                          })
                  ]));
            } else {
              return Text(
                description,
                style: const TextStyle(
                    color: Colors.grey, fontSize: 16, height: 1.5),
              );
            }
          })),
        ],
      ),
    );
  }
}
