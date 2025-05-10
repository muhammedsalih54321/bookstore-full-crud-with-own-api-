part of 'bookstrore4_bloc.dart';

@immutable
sealed class Bookstore4State {}

final class Bookstore4Initial extends Bookstore4State {}
class Bookstore4loading extends Bookstore4State {}
class Bookstore4loaded extends Bookstore4State {}
class Bookstore4error extends Bookstore4State {}
