import 'package:bookly_app/core/errors/faliures.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp extends HomeRepo {
  // MAKE THAT TO GET THE GET METHOD FROM THE API SERVICE CLASS
  final Apiservice apiservice;
  HomeRepoImp(this.apiservice);
  @override
  Future<Either<Faliures, List<BookModel>>> fetchBestNewestBooks() async {
    try {
      var data = await apiservice.get(
        endPoint:
            'volumes?q=science fiction&filter=free-ebooks&Sorting=newest&key=AIzaSyAvmfCN8XYVRNIEFj_zlrV6yspj493pOvA',
      );
      List<BookModel> books = [];
      // 'items' that the name of the list in api response in postman that contains the list of books
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFaliures.fromDioError(e));
      }
      // another type of error that is not from dio package
      else {
        return Left(ServerFaliures(e.toString()));
      }
    }
  }

  @override
  Future<Either<Faliures, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiservice.get(
        endPoint:
            'volumes?q=Programming&filter=free-ebooks&key=AIzaSyAvmfCN8XYVRNIEFj_zlrV6yspj493pOvA',
      );
      List<BookModel> books = [];
      // 'items' that the name of the list in api response in postman that contains the list of books
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFaliures.fromDioError(e));
      }
      // another type of error that is not from dio package
      else {
        return Left(ServerFaliures(e.toString()));
      }
    }
  }

  // fetch similar books based on the category of the book that the user clicked on

  @override
  Future<Either<Faliures, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiservice.get(
        endPoint:
            'volumes?q=$category&filter=free-ebooks&key=AIzaSyAvmfCN8XYVRNIEFj_zlrV6yspj493pOvA',
      );
      List<BookModel> books = [];
      // 'items' that the name of the list in api response in postman that contains the list of books
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFaliures.fromDioError(e));
      }
      // another type of error that is not from dio package
      else {
        return Left(ServerFaliures(e.toString()));
      }
    }
  }
}
