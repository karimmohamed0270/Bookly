import 'package:bookly_app/features/home/presentation/views/widgets/book_details_lowersection.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_uppersection.dart';

import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          // to make all screen scrool if i want when width become large may be yes may be not that case
          hasScrollBody: false,
          child: Column(
            children: [
              BookDetailsUpperSection(),
              SizedBox(height: 10),

              BookDetailsLowersection(),
            ],
          ),
        ),
      ],
    );
  }
}
