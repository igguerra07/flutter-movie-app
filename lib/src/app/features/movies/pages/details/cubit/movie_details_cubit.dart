import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../entities/movie.dart';
import '../../../usecases/get_movie_details_use_case.dart';
import 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  late final GetMovieDetailsUseCase _getMovieDetails;

  MovieDetailsCubit({
    required GetMovieDetailsUseCase getMovieDetailsUseCase,
  }) : super(MovieDetailsInitialState()) {
    _getMovieDetails = getMovieDetailsUseCase;
  }

  Future<void> getMovieDetails(Movie movie) async {
    emit(MovieDetailsLoadingState());

    final params = GetMovieDetailsUseCaseParams(movie: movie);
    final eitherResult = await _getMovieDetails(params);

    eitherResult.fold(
      (failure) => emit(MovieDetailsFailureState(failure: failure)),
      (result) {
        final newState = MovieDetailsLoadedState(
          cast: result.cast,
          movie: result.movie,
          trailers: result.videos,
        );
        emit(newState);
      },
    );
  }
}
