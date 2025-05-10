import 'package:bloc/bloc.dart';
import 'package:books_store/Repository/api/api_class.dart';
import 'package:books_store/Repository/model/book-store2.dart';
import 'package:meta/meta.dart';

part 'bookstore2_event.dart';
part 'bookstore2_state.dart';

class Bookstore2Bloc extends Bloc<Bookstore2Event, Bookstore2State> {
  late Bookstoremodel2 bookstoremodel2;
  Bookstoreapi bookstoreapi = Bookstoreapi();
  Bookstore2Bloc() : super(Bookstore2Initial()) {
    on<Fetchbookstore>((event, emit) async {
      emit(Bookstore2loading());
      try {
        bookstoremodel2 = await bookstoreapi.getbookstore();
        emit(Bookstore2loaded());
      } catch (e) {
        emit(Bookstore2error());
      }
    });
  }
}
