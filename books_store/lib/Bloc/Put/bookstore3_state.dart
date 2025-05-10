part of 'bookstore3_bloc.dart';

@immutable
sealed class Bookstore3State {}

final class Bookstore3Initial extends Bookstore3State {}
class Bookstore3loading extends Bookstore3State {}
class Bookstore3loaded extends Bookstore3State {}
class Bookstore3error extends Bookstore3State {}