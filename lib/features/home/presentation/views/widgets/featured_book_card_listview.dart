import 'package:bookly_app/core/utils/widgets/errorwidget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_book_card.dart';
import 'package:bookly_app/features/home/presentation/views_model/cubits/featured_book_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCardListview extends StatelessWidget {
  const BookCardListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        print(state.runtimeType);
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              // itemBuilder: (context, index) {
              //   final imageUrl =
              //       state.books[index].volumeInfo.imageLinks.thumbnail;

              //   // print(imageUrl);

              //   return Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 8),
              //     child: BookCard(imageUrl: imageUrl),
              //   );
              // },
              itemBuilder: (context, index) {
                String imageUrl =
                    state.books[index].volumeInfo.imageLinks?.thumbnail ?? '';

                imageUrl = imageUrl
                    .replaceAll('http://', 'https://')
                    .replaceAll('&zoom=1', '&zoom=0');

                print(imageUrl);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: BookCard(imageUrl: imageUrl),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return Errorswidget(errorMes: state.errMsg);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
