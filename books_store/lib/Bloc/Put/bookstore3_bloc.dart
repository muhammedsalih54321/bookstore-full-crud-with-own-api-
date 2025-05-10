import 'package:bloc/bloc.dart';
import 'package:books_store/Repository/api/api_class.dart';
import 'package:books_store/Repository/model/book-store3.dart';
import 'package:meta/meta.dart';

part 'bookstore3_event.dart';
part 'bookstore3_state.dart';

class Bookstore3Bloc extends Bloc<Bookstore3Event, Bookstore3State> {
  late Bookstoremodel3 bookstoremodel3;
  Bookstoreapi bookstoreapi = Bookstoreapi();
  Bookstore3Bloc() : super(Bookstore3Initial()) {
    on<Updatebookstore>((event, emit) async {
      emit(Bookstore3loading());
      try {
        bookstoremodel3 = await bookstoreapi.updateBookstore(
          event.id,
          event.title,
          event.author,
          event.publishYear,
        );
        emit(Bookstore3loaded());
      } catch (e) {
        emit(Bookstore3error());
      }
    });
  }
}
