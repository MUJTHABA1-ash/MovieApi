import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled6/Repository/Api/Movie/Movie.dart';
import 'package:untitled6/Repository/Model_class/Movie_model.dart';

part 'movie_event.dart';

part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  late Moviemodel moviemodel;
  MovieApi movieApi = MovieApi();

  MovieBloc() : super(MovieInitial()) {
    on<MovieEvent>((event, emit) async {
      emit(Movieloading());
      try {
        moviemodel = await movieApi.getMovie();
        emit(Movieloaded());
      } catch (e) {
        emit(
          Movieerror(),
        );
      }

      // TODO: implement event handler
    });
  }
}
