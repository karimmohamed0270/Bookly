import 'package:bookly_app/features/home/presentation/views/widgets/featured_book_card.dart';
import 'package:flutter/material.dart';

class SimilarBookListview extends StatelessWidget {
  const SimilarBookListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // add sized box and fixed height because there are listview inside column
      // take 0.3 of the hieght of the screen
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: BookCard(
              imageUrl:
                  'https://th.bing.com/th/id/OIP.bmUlapXsHl9dgOX9hMltngHaLk?w=115&h=180&c=7&r=0&o=7&pid=1.7&rm=3',
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
