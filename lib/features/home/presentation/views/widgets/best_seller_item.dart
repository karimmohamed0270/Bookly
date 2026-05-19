import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    final imageUrl = (bookModel.volumeInfo.imageLinks?.thumbnail ?? '')
        .replaceFirst('http://', 'https://');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: GestureDetector(
        onTap: () {
          // when nav to deails screnn take data to it using extra in go router to show it in the details screen
          GoRouter.of(context).push('/bookdetails', extra: bookModel);
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.width * 0.40,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 2.7 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.fill,

                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),

                    errorWidget: (context, url, error) =>
                        const Icon(Icons.book, size: 50),
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

                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        bookModel.volumeInfo.authors?.first ?? "Unknown Author",
                        maxLines: 1,
                        style: Styles.textStyle16.copyWith(color: Colors.grey),
                      ),
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
