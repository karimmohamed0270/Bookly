import 'package:bookly_app/features/home/presentation/views/widgets/featured_book_card.dart';
import 'package:flutter/material.dart';

class BookCardListview extends StatelessWidget {
  const BookCardListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // add sized box and fixed height because there are listview inside column
      // take 0.3 of the hieght of the screen
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: BookCard(),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
