part of 'book_service_cubit.dart';

sealed class BookServiceState extends Equatable {
  const BookServiceState();

  @override
  List<Object> get props => [];
}

final class BookServiceInitial extends BookServiceState {}

final class BookServiceLoading extends BookServiceState {}

final class BookServiceFailure extends BookServiceState {
  final String errMessage;
  const BookServiceFailure({
    required this.errMessage,
  });
}

final class BookServiceSuccess extends BookServiceState {
  final BookService bookService;

  const BookServiceSuccess({
    required this.bookService,
  });
}
