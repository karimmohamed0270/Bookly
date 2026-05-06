import 'package:bookly_app/features/home/presentation/views/widgets/bookdetails_appbar.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: BookDetailsAppBar(),
        ),
      ],
    );
  }
}
