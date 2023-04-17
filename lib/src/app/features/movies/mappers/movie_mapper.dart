import '../entities/movie.dart';
import '../models/movie_model.dart';

extension MovieExtension on Movie {
  MovieModel toModel() {
    return MovieModel(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
      popularity: popularity,
      releaseDate: releaseDate,
      backdropPath: backdropPath,
      voteAverage: voteAverage,
    );
  }
}

extension MoviesListExtension on List<Movie> {
  List<MovieModel> toDomainModel() {
    final models = map((model) => model.toModel());
    return models.toList();
  }
}

extension MovieModelExtension on MovieModel {
  Movie toDomainModel() {
    return Movie(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
      popularity: popularity,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      backdropPath: backdropPath,
    );
  }
}

extension MoviesModelListExtension on List<MovieModel> {
  List<Movie> toDomainModel() {
    final movies = map((model) => model.toDomainModel());
    return movies.toList();
  }
}
