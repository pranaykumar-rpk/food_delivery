import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final int length;
  final int index;

  const DotsIndicator({Key? key, required this.length, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return length > 1
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              length,
              (i) => (index == i)
                  ? Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        height: 16,
                        width: 16,
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          height: 12,
                          width: 12,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.orange),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                      ),
                    ),
            ),
          )
        : const SizedBox.shrink();
  }
}
