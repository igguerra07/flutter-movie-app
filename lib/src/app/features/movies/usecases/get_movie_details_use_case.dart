import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movie_app/src/app/features/cast/cast.dart';
import 'package:movie_app/src/app/features/videos/videos.dart';
import 'package:movie_app/src/shared/errors/failures/failure.dart';
import 'package:movie_app/src/shared/usecases/usecases.dart';

import '../entities/movie.dart';

typedef _GetMovieDetailsUseCase
    = UseCase<GetMovieDetailsUseCaseResult, GetMovieDetailsUseCaseParams>;

class GetMovieDetailsUseCaseParams extends Equatable {
  final Movie movie;

  const GetMovieDetailsUseCaseParams({
    required this.movie,
  });

  @override
  List<Object?> get props => [movie];
}

class GetMovieDetailsUseCaseResult extends Equatable {
  final Movie movie;
  final List<Actor> cast;
  final List<Video> videos;

  const GetMovieDetailsUseCaseResult({
    required this.movie,
    required this.cast,
    required this.videos,
  });

  @override
  List<Object?> get props => [movie, cast, videos];
}

class GetMovieDetailsUseCase implements _GetMovieDetailsUseCase {
  late final CastRepository _castRepository;
  late final VideosRepository _videosRepository;

  GetMovieDetailsUseCase({
    required CastRepository castRepository,
    required VideosRepository videosRepository,
  }) {
    _castRepository = castRepository;
    _videosRepository = videosRepository;
  }

  @override
  Future<Either<Failure, GetMovieDetailsUseCaseResult>> call(
    GetMovieDetailsUseCaseParams params,
  ) async {
    final movie = params.movie;

    final eitherCast = await _castRepository.findByMovieId(movie.id);

    return eitherCast.fold(
      (failure) => left(failure),
      (cast) => _getTrailers(movie: movie, cast: cast),
    );
  }

  Future<Either<Failure, GetMovieDetailsUseCaseResult>> _getTrailers({
    required Movie movie,
    required List<Actor> cast,
  }) async {
    final eitherCast = await _videosRepository.findManyByMovieId(movie.id);

    return eitherCast.fold(
      (failure) => left(failure),
      (videos) {
        final result = GetMovieDetailsUseCaseResult(
          movie: movie,
          cast: cast,
          videos: videos,
        );
        return right(result);
      },
    );
  }
}
