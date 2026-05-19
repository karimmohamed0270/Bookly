import 'package:bookly_app/features/home/presentation/views/widgets/featured_book_card.dart';
import 'package:bookly_app/features/home/presentation/views_model/cubits/similar_book_cubit/similar_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBookListview extends StatelessWidget {
  const SimilarBookListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBookCubitCubit, SimilarBookCubitState>(
      builder: (context, state) {
        if (state is SimilarBookStateSuccess) {
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
                        state.books[index].volumeInfo?.imageLinks?.thumbnail ??
                        "",
                  ),
                );
              },
              itemCount: 10,
            ),
          );
        } else if (state is SimilarBookStateFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
