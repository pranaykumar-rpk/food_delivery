import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CommonRatingBar extends StatelessWidget {
  final double rating;
  final String title;
  final double itemSize;
  const CommonRatingBar(
      {super.key,
      required this.rating,
      required this.title,
      this.itemSize = 14});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          itemCount: 5,
          rating: rating,
          itemSize: itemSize,
          itemBuilder: (context, index) {
            return Icon(
              Icons.star,
              color: Colors.amber,
              size: itemSize,
            );
          },
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
