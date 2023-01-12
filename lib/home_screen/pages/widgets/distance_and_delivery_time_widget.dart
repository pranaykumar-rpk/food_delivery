import 'package:flutter/material.dart';

class DistanceAndDeliveryTimeWidget extends StatelessWidget {
  final double distanceInKms;
  final int estimatedDeliveryTimeInMins;
  const DistanceAndDeliveryTimeWidget(
      {super.key,
      required this.distanceInKms,
      required this.estimatedDeliveryTimeInMins});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$distanceInKms km',
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          width: 5,
          height: 5,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '$estimatedDeliveryTimeInMins min delivery',
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
        ),
      ],
    );
  }
}
