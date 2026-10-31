import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class TmdbApiService {
  // Demo API Key TMDB Read-Only (Gratis & Publik)
  static const String _apiKey = '2dca580c2a14b55200e784d157207b4d';
  static const String _baseUrl = 'https://api.themoviedb.org/3';

  // GET Trending Movies (Spesifikasi REST API GET)
  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/trending/movie/week?api_key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data trending film dari TMDB API');
    }
  }

  // GET Search Movies
  Future<List<MovieModel>> searchMovies(String query) async {
    if (query.trim().isEmpty) return [];

    final response = await http.get(
      Uri.parse('$_baseUrl/search/movie?api_key=$_apiKey&query=${Uri.encodeComponent(query)}'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Gagal melakukan pencarian film');
    }
  }
}