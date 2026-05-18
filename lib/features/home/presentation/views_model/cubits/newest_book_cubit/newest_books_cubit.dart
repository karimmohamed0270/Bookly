import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  // import rep to get the imp of the methods

  final HomeRepo homeRepo;

  // create the fun and the imp i will get it from rep

  Future<void> fetchNewestBooks() async {
    // intial state
    emit(NewestBooksLoading());

    var result = await homeRepo.fetchBestNewestBooks();

    result.fold(
      (failure) {
        emit(NewestBooksFailure(failure.errormessage));
      },
      (books) {
        emit(NewestBooksSuccess(books));
      },
    );
  }
}
