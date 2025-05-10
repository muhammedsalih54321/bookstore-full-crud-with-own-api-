part of 'bookstore1_bloc.dart';

@immutable
sealed class Bookstore1Event {}

class  Postbookstore extends Bookstore1Event {
  final String title;
  final String author;
  final int publishYear;

  Postbookstore({
    required this.title,
    required this.author,
    required this.publishYear,
  });
}
