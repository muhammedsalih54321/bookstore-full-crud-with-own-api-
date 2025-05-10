import 'package:bloc/bloc.dart';
import 'package:books_store/Repository/api/api_class.dart';
import 'package:books_store/Repository/model/book-store1.dart';
import 'package:meta/meta.dart';

part 'bookstore1_event.dart';
part 'bookstore1_state.dart';

class Bookstore1Bloc extends Bloc<Bookstore1Event, Bookstore1State> {
  late Bookstoremodel1 bookstoremodel1;
  Bookstoreapi bookstoreapi = Bookstoreapi();
  Bookstore1Bloc() : super(Bookstore1Initial()) {
    on<Postbookstore>((event, emit) async {
      emit(Bookstore1loading());
      try {
        bookstoremodel1 = await bookstoreapi.postBookstore(
          event.title,
          event.author,
          event.publishYear,
        );
        emit(Bookstore1loaded());
      } catch (e) {
        emit(Bookstore1error());
        print(e);
      }
    });
  }
}
