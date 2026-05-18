part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}

// state 1
class NewestBooksLoading extends NewestBooksState {}

// state 2
class NewestBooksSuccess extends NewestBooksState {
  final List<BookModel> books;
  const NewestBooksSuccess(this.books);
}

// state3
class NewestBooksFailure extends NewestBooksState {
  final String errMsg;
  const NewestBooksFailure(this.errMsg);
}
