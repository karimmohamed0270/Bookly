import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_body.dart';
import 'package:bookly_app/features/home/presentation/views_model/cubits/similar_book_cubit/similar_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key, required this.bookmodel});
  final BookModel bookmodel;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBookCubitCubit>(context).fetchSimilarBooks(
      category:
          widget.bookmodel.volumeInfo?.categories?.first ?? "Unknown Category",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BookDetailsBody(bookModel: widget.bookmodel));
  }
}
