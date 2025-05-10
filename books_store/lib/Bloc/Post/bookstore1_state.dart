part of 'bookstore1_bloc.dart';

@immutable
sealed class Bookstore1State {}

final class Bookstore1Initial extends Bookstore1State {}
class Bookstore1loading extends Bookstore1State {}
class Bookstore1loaded extends Bookstore1State {}
class Bookstore1error extends Bookstore1State {}
