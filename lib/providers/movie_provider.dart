import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../repositories/movie_repository.dart';

enum ApiState { initial, loading, loaded, error, empty }

class MovieProvider extends ChangeNotifier {
  final MovieRepository _repository = MovieRepository();

  List<MovieModel> _trendingMovies = [];
  List<MovieModel> _searchResults = [];
  
  ApiState _state = ApiState.initial;
  String _errorMessage = '';

  List<MovieModel> get trendingMovies => _trendingMovies;
  List<MovieModel> get searchResults => _searchResults;
  ApiState get state => _state;
  String get errorMessage => _errorMessage;

  // Fetch Trending Movies
  Future<void> loadTrendingMovies() async {
    _state = ApiState.loading;
    _errorMessage = '';
    notifyListeners();

    try {
      _trendingMovies = await _repository.fetchTrendingMovies();
      if (_trendingMovies.isEmpty) {
        _state = ApiState.empty;
      } else {
        _state = ApiState.loaded;
      }
    } catch (e) {
      _state = ApiState.error;
      _errorMessage = e.toString();
    }
    notifyListeners();
  }

  // Search Movies
  Future<void> searchMovies(String query) async {
    if (query.trim().isEmpty) {
      _searchResults = [];
      notifyListeners();
      return;
    }

    _state = ApiState.loading;
    _errorMessage = '';
    notifyListeners();

    try {
      _searchResults = await _repository.searchMovies(query);
      if (_searchResults.isEmpty) {
        _state = ApiState.empty;
      } else {
        _state = ApiState.loaded;
      }
    } catch (e) {
      _state = ApiState.error;
      _errorMessage = e.toString();
    }
    notifyListeners();
  }
}