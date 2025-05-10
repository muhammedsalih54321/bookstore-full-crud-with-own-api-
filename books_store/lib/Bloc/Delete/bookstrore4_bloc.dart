import 'package:bloc/bloc.dart';
import 'package:books_store/Repository/api/api_class.dart';
import 'package:books_store/Repository/model/book-store4.dart';
import 'package:meta/meta.dart';

part 'bookstrore4_event.dart';
part 'bookstrore4_state.dart';

class Bookstore4Bloc extends Bloc<Bookstore4Event, Bookstore4State> {
  late Bookstoremodel4 bookstoremodel4;
  Bookstoreapi bookstoreapi = Bookstoreapi();
  Bookstore4Bloc() : super(Bookstore4Initial()) {
    on<Deletebookstore>((event, emit) async {
      emit(Bookstore4loading());
      try {
        bookstoremodel4 = await bookstoreapi.deletebookstore(event.id);
        emit(Bookstore4loaded());
      } catch (e) {
        emit(Bookstore4error());
      }
    });
  }
}
