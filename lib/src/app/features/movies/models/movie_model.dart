class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double popularity;
  final double voteAverage;
  final String releaseDate;
  final String backdropPath;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.popularity,
    required this.voteAverage,
    required this.releaseDate,
    required this.backdropPath,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'backdrop_path': backdropPath,
      'vote_average': voteAverage,
    };
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id']?.toInt() ?? 0,
      title: json['title'] ?? json['name'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      popularity: json['popularity']?.toDouble() ?? 0.0,
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      releaseDate: json['release_date'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
    );
  }

  static List<MovieModel> fromJsonList(List? jsonList) {
    if (jsonList == null) return [];
    final movies = jsonList.map((json) => MovieModel.fromJson(json));
    return movies.toList();
  }
}
