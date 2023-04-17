import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/movies_repository.dart';
import 'movie_search_state.dart';

class MovieSearchCubit extends Cubit<MovieSearchState> {
  late final MoviesRepository _moviesRepository;

  String? previousQuery;

  MovieSearchCubit({
    required MoviesRepository moviesRepository,
  }) : super(MovieSearchInitialState()) {
    _moviesRepository = moviesRepository;
  }

  Future<void> searchMovies(String query) async {
    if (previousQuery == query) return;

    previousQuery = query;

    emit(MovieSearchLoadingState());

    final eitherResult = await _moviesRepository.search(query: query);

    eitherResult.fold(
      (failure) => emit(MovieSearchFailureState(failure: failure)),
      (movies) {
        if (movies.isEmpty) {
          final newState = query.isEmpty
              ? MovieSearchInitialState()
              : MovieSearchEmptyState(query: query);
          emit(newState);
          return;
        }

        emit(MovieSearchLoadedState(movies: movies));
      },
    );
  }
}
