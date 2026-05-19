import 'package:bookly_app/core/errors/faliures.dart';
import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  // the return type is either faliures or list of books
  Future<Either<Faliures, List<BookModel>>> fetchBestNewestBooks();
  Future<Either<Faliures, List<BookModel>>> fetchFeaturedBooks();
  // new cubit in deatils screen to fetch similar books based on the category of the book that the user clicked on
  Future<Either<Faliures, List<BookModel>>> fetchSimilarBooks({
    required String category,
  });
}
