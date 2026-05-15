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
        // success
        if (state is FeaturedBooksSuccess) {
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
        // failure and loading state
        else if (state is FeaturedBooksFailure) {
          return Errorswidget(errorMes: state.errMsg);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
