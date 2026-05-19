import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/bbok_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/bookdetails_appbar.dart';
import 'package:flutter/material.dart';

class BookDetailsUpperSection extends StatelessWidget {
  const BookDetailsUpperSection({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    // replace http with https
    final imageUrl = (bookModel.volumeInfo?.imageLinks?.thumbnail ?? '')
        .replaceFirst('http://', 'https://');

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: BookDetailsAppBar(),
        ),

        // image
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .32),
          child: AspectRatio(
            aspectRatio: 2.7 / 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: imageUrl.isNotEmpty
                      ? NetworkImage(imageUrl)
                      : const AssetImage(AssetsData.testBook) as ImageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),

        // title and subtitle
        const SizedBox(height: 10),

        Text(
          bookModel.volumeInfo?.title ?? "No Title",
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),

        Text(
          bookModel.volumeInfo?.authors?[0] ?? "No Author",
          style: Styles.textSize18.copyWith(color: Colors.grey),
        ),

        const SizedBox(height: 5),

        // rating
        BestSellerRating(
          year: bookModel.volumeInfo?.publishedDate ?? "No Date",
        ),

        const SizedBox(height: 8),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38),
          child: BookAction(bookmodel: bookModel),
        ),
      ],
    );
  }
}
