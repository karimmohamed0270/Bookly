import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  // import rep to get the imp of the methods

  final HomeRepo homeRepo;

  // create the fun and the imp i will get it from rep

  Future<void> fetchFeaturedBooks() async {
    // intial state
    emit(FeaturedBooksLoading());

    var result = await homeRepo.fetchBestNewestBooks();

    result.fold(
      (failure) {
        emit(FeaturedBooksFailure(failure.errormessage));
      },
      (books) {
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
