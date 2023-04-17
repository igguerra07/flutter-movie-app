import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/src/app/di/injector.dart';

import 'package:movie_app/src/app/routes/routes.dart';

import '../../entities/movie.dart';
import '../details/movies_details_page_params.dart';
import '../search/movies_search_delegate.dart';
import 'cubit/cubit.dart';
import 'widgets/movies_list.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final moviesCubit = getIt<MoviePageCubit>();

  @override
  void initState() {
    super.initState();
    moviesCubit.getTrendingMovies();
  }

  @override
  void dispose() {
    moviesCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings),
        ),
        actions: [
          IconButton(
            onPressed: _showSearch,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder(
          bloc: moviesCubit,
          builder: (_, state) {
            if (state is MoviesPageLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MoviesPageFailureState) {
              return Center(
                child: Text(state.failure.message ?? "ERROR"),
              );
            }
            if (state is MoviesPageLoadedState) {
              final movies = state.movies;
              return MoviesList(
                movies: movies,
                onRefresh: _onRefresh,
                onMovieTap: _onMovieTap,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    await moviesCubit.getTrendingMovies();
  }

  void _onMovieTap(Movie movie) {
    final navigator = Navigator.of(context);
    final params = MovieDetailsPageParams(movie: movie);
    navigator.pushNamed(
      RoutesConstants.movie,
      arguments: params,
    );
  }

  void _showSearch() {
    showSearch(
      context: context,
      delegate: MoviesSearchDelegate(
        onMovieTap: _onMovieTap,
      ),
    );
  }
}
