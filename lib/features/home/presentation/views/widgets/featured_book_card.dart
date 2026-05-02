import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsData.testBook),
            fit: BoxFit.fill,
          ),
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
