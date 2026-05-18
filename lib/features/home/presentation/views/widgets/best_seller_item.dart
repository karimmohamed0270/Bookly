import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: GestureDetector(
        onTap: () {
          // Handle tap event
          GoRouter.of(context).push('/bookdetails');
        },
        child: Container(
          // for testing only to see the size of the container
          // color: Colors.red.withOpacity(0.2),
          height: MediaQuery.of(context).size.width * 0.35,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 2.7 / 4,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        bookModel.volumeInfo.imageLinks?.thumbnail ??
                            AssetsData.testBook,
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        bookModel.volumeInfo.title ?? "No Title",
                        style: Styles.textStyle20,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      bookModel.volumeInfo.authors?.first ?? "Unknown Author",
                      style: Styles.textStyle16.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text("Free", style: Styles.textSize18),
                        const Spacer(),
                        BestSellerRating(
                          year:
                              bookModel.volumeInfo.publishedDate ??
                              "Unknown Date",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
