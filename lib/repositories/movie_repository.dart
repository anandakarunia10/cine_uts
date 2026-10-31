import '../models/movie_model.dart';
import '../services/tmdb_api_service.dart';

class MovieRepository {
  final TmdbApiService _apiService = TmdbApiService();

  Future<List<MovieModel>> fetchTrendingMovies() async {
    return await _apiService.getTrendingMovies();
  }

  Future<List<MovieModel>> searchMovies(String query) async {
    return await _apiService.searchMovies(query);
  }
}