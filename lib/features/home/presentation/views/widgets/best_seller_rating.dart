import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BestSellerRating extends StatelessWidget {
  const BestSellerRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber),
        const SizedBox(width: 5),
        Text("4.5", style: Styles.textStyle16),
        const SizedBox(width: 5),
        Text("(2392)", style: Styles.textStyle14.copyWith(color: Colors.grey)),
      ],
    );
  }
}
