part of 'bookstore2_bloc.dart';

@immutable
sealed class Bookstore2State {}

final class Bookstore2Initial extends Bookstore2State {}
class Bookstore2loading extends Bookstore2State {}
class Bookstore2loaded extends Bookstore2State {}
class Bookstore2error extends Bookstore2State {}
