import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/app/di/injector.dart';

import 'package:movie_app/src/app/widgets/widgets.dart';

import '../../entities/movie.dart';
import '../list/widgets/movies_list.dart';
import 'cubit/cubit.dart';

class MoviesSearchDelegate extends SearchDelegate {
  late final MovieSearchCubit _movieSearchCubit;
  final Function(Movie) onMovieTap;

  MoviesSearchDelegate({
    required this.onMovieTap,
  }) {
    _movieSearchCubit = getIt();
  }

  @override
  void close(BuildContext context, result) {
    _movieSearchCubit.close();
    super.close(context, result);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _movieSearchCubit.searchMovies(query);

    return BlocBuilder(
      bloc: _movieSearchCubit,
      builder: (_, state) {
        if (state is MovieSearchInitialState) {
          return const Center(
            child: Text("Type a query"),
          );
        }
        if (state is MovieSearchLoadingState) {
          return const LoadingContainer();
        }
        if (state is MovieSearchFailureState) {
          return FailureWidget(failure: state.failure);
        }
        if (state is MovieSearchEmptyState) {
          return Center(
            child: Text("No data found for ${state.query}"),
          );
        }
        if (state is MovieSearchLoadedState) {
          return MoviesList(
            movies: state.movies,
            onMovieTap: onMovieTap,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
