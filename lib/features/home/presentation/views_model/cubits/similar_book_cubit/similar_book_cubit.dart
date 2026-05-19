import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_book_state.dart';

class SimilarBookCubitCubit extends Cubit<SimilarBookCubitState> {
  SimilarBookCubitCubit(this.homeRepo) : super(SimilarBookCubitInitial());

  // import rep to get the imp of the methods

  final HomeRepo homeRepo;

  // create the fun and the imp i will get it from rep

  Future<void> fetchSimilarBooks({required String category}) async {
    // intial state
    emit(SimilarBookStateLoading());

    var result = await homeRepo.fetchSimilarBooks(category: category);

    result.fold(
      (failure) {
        emit(SimilarBookStateFailure(failure.errormessage));
      },
      (books) {
        emit(SimilarBookStateSuccess(books));
      },
    );
  }
}
