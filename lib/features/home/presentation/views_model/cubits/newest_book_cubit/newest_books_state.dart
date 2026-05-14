part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}

// state 1
class FeaturedBooksLoading extends NewestBooksState {}

// state 2
class FeaturedBooksSuccess extends NewestBooksState {
  final List<BookModel> books;
  const FeaturedBooksSuccess(this.books);
}

// state3
class FeaturedBooksFailure extends NewestBooksState {
  final String errMsg;
  const FeaturedBooksFailure(this.errMsg);
}
