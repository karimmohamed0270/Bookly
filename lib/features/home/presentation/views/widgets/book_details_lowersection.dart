import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_book._listview.dart';
import 'package:flutter/material.dart';

class BookDetailsLowersection extends StatelessWidget {
  const BookDetailsLowersection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("Simialr Books", style: Styles.textSize18),
          ),
        ),
        const SizedBox(height: 8),
        // book similiar
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: SimilarBookListview(),
        ),
      ],
    );
  }
}
