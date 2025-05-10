part of 'bookstrore4_bloc.dart';

@immutable
sealed class Bookstore4Event {}
class Deletebookstore extends Bookstore4Event{
  final String id;

  Deletebookstore({required this.id});
  
}
