part of 'similar_book_cubit.dart';

sealed class SimilarBookCubitState extends Equatable {
  const SimilarBookCubitState();

  @override
  List<Object> get props => [];
}

final class SimilarBookCubitInitial extends SimilarBookCubitState {}

class SimilarBookStateSuccess extends SimilarBookCubitState {
  final List<BookModel> books;
  const SimilarBookStateSuccess(this.books);
}

class SimilarBookStateFailure extends SimilarBookCubitState {
  final String errMsg;
  const SimilarBookStateFailure(this.errMsg);
}

class SimilarBookStateLoading extends SimilarBookCubitState {}
