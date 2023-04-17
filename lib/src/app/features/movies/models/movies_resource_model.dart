import 'package:movie_app/src/app/features/movies/models/models.dart';

class MoviesResourceModel {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<MovieModel> results;

  MoviesResourceModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'total_pages': totalPages,
      'total_results': totalResults,
      'results': results.map((x) => x.toJson()).toList(),
    };
  }

  factory MoviesResourceModel.fromMap(Map<String, dynamic> map) {
    return MoviesResourceModel(
      page: map['page']?.toInt() ?? 0,
      totalPages: map['total_pages']?.toInt() ?? 0,
      totalResults: map['total_results']?.toInt() ?? 0,
      results: List<MovieModel>.from(
        map['results']?.map((x) => MovieModel.fromJson(x)),
      ),
    );
  }
}
