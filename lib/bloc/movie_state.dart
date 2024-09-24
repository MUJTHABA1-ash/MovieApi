part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}
class Movieloading extends MovieState{}
class Movieloaded extends MovieState{}
class Movieerror extends MovieState{}