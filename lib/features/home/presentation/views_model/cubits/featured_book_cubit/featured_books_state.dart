part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

// state 1
class FeaturedBooksLoading extends FeaturedBooksState {}

// state 2
class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookModel> books;
  const FeaturedBooksSuccess(this.books);
}

// state3
class FeaturedBooksFailure extends FeaturedBooksState {
  final String errMsg;
  const FeaturedBooksFailure(this.errMsg);
}
