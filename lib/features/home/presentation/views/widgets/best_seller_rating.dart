import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BestSellerRating extends StatelessWidget {
  const BestSellerRating({
    super.key,
    required this.year,
    // required this.ratingCount,
  });
  final String year;
  // final int ratingCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star, color: Colors.amber),
        const SizedBox(width: 5),
        Text(
          "(${0})", // Replace 0 with ratingCount when available
          style: Styles.textStyle14.copyWith(color: Colors.grey),
        ),

        const SizedBox(width: 5),
        Text(year, style: Styles.textStyle16),
      ],
    );
  }
}
