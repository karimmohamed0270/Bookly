import 'package:bookly_app/features/home/data/models/book/book.dart';
import 'package:equatable/equatable.dart';

abstract class FeaturedBooksStates extends Equatable {
  const FeaturedBooksStates();

  @override
  List<Object> get props => [];
}

class FeaturedBooksIntial extends FeaturedBooksStates {}

class FeaturedBooksLoading extends FeaturedBooksStates {}

class FeaturedBooksSuccess extends FeaturedBooksStates {
  final List<BookModel> books;
  const FeaturedBooksSuccess(this.books);
}

class FeaturedBooksFailure extends FeaturedBooksStates {
  final String errMsg;
  const FeaturedBooksFailure(this.errMsg);
}
