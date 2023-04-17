import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/src/app/di/di.dart';
import 'package:movie_app/src/app/routes/routes.dart';
import 'package:movie_app/src/app/features/videos/videos.dart';

import '../../entities/movie.dart';
import 'cubit/cubit.dart';
import 'movies_details_page_params.dart';
import 'widgets/widgets.dart';

class MovieDetailsPage extends StatefulWidget {
  final MovieDetailsPageParams params;

  const MovieDetailsPage({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final MovieDetailsCubit _cubit = getIt();

  Movie get movie => widget.params.movie;

  @override
  void initState() {
    super.initState();
    _cubit.getMovieDetails(movie);
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final deviceSize = MediaQuery.of(context).size;
    final deviceHeight = deviceSize.height;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder(
          bloc: _cubit,
          builder: (_, state) {
            if (state is MovieDetailsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MovieDetailsFailureState) {
              return Center(
                child: Text(state.failure.message ?? "Something went wrong..."),
              );
            }
            if (state is MovieDetailsLoadedState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: deviceHeight * .3,
                      child: MovieBackdrop(
                        backdropUrl: movie.backdropUrl,
                        onPressed: _onBack,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MovieHeadline(movie: movie),
                          const SizedBox(height: 16),
                          Text(
                            movie.overview,
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    CastList(cast: state.cast),
                    TrailersList(
                      trailers: state.trailers,
                      onTap: (trailer) => _onTapTrailer(
                        trailer: trailer,
                        trailers: state.trailers,
                      ),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _onBack() {
    Navigator.of(context).pop();
  }

  Future<void> _onTapTrailer({
    required Video trailer,
    required List<Video> trailers,
  }) async {
    final params = VideoPageParams(trailer: trailer, trailers: trailers);
    Navigator.of(context).pushNamed(
      RoutesConstants.trailers,
      arguments: params,
    );
    // await launchUrl(
    //   mode: LaunchMode.inAppWebView,
    //   Uri.parse(trailer.url),
    // );
  }
}
