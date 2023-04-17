import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/movies_repository.dart';
import 'movies_page_state.dart';

class MoviePageCubit extends Cubit<MoviesPageState> {
  late final MoviesRepository _moviesRepository;

  MoviePageCubit({
    required MoviesRepository moviesRepository,
  }) : super(MoviesPageInitialState()) {
    _moviesRepository = moviesRepository;
  }

  Future<void> getTrendingMovies() async {
    emit(MoviesPageLoadingState());

    final eitherResult = await _moviesRepository.getTrending();

    eitherResult.fold(
      (failure) => emit(MoviesPageFailureState(failure: failure)),
      (movies) => emit(MoviesPageLoadedState(movies: movies)),
    );
  }
}
