import 'package:flutter/material.dart';
import '../models/watchlist_model.dart';
import '../repositories/watchlist_repository.dart';

enum WatchlistState { initial, loading, loaded, error, empty }

class WatchlistProvider extends ChangeNotifier {
  final WatchlistRepository _repository = WatchlistRepository();

  // Gantilah NIM ini sesuai NIM milikmu
  final String studentId = '2455011010';

  List<WatchlistModel> _watchlist = [];
  WatchlistState _state = WatchlistState.initial;
  String _errorMessage = '';

  List<WatchlistModel> get watchlist => _watchlist;
  WatchlistState get state => _state;
  String get errorMessage => _errorMessage;

  // READ
  Future<void> loadWatchlist() async {
    _state = WatchlistState.loading;
    _errorMessage = '';
    notifyListeners();

    try {
      _watchlist = await _repository.fetchWatchlist(studentId);
      if (_watchlist.isEmpty) {
        _state = WatchlistState.empty;
      } else {
        _state = WatchlistState.loaded;
      }
    } catch (e) {
      _state = WatchlistState.error;
      _errorMessage = e.toString();
    }
    notifyListeners();
  }

  // CREATE
  Future<bool> addWatchlist(WatchlistModel item) async {
    try {
      await _repository.addWatchlist(item);
      await loadWatchlist();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  // UPDATE
  Future<bool> updateWatchlist(String id, double rating, String note, String status) async {
    try {
      await _repository.updateWatchlist(id, rating, note, status);
      await loadWatchlist();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  // DELETE
  Future<bool> deleteWatchlist(String id) async {
    try {
      await _repository.deleteWatchlist(id);
      await loadWatchlist();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }
}