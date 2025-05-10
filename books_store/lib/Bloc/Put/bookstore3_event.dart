part of 'bookstore3_bloc.dart';

@immutable
sealed class Bookstore3Event {}

class Updatebookstore extends Bookstore3Event {
  final String id;
  final String title;
  final String author;
  final int publishYear;

  Updatebookstore({required this.id, required this.title, required this.author, required this.publishYear});
}
