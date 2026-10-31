import '../models/watchlist_model.dart';
import '../services/supabase_service.dart';

class WatchlistRepository {
  final SupabaseService _service = SupabaseService();

  Future<List<WatchlistModel>> fetchWatchlist(String studentId) async {
    return await _service.getWatchlist(studentId);
  }

  Future<void> addWatchlist(WatchlistModel item) async {
    await _service.addWatchlist(item);
  }

  Future<void> updateWatchlist(String id, double rating, String note, String status) async {
    await _service.updateWatchlist(id, rating, note, status);
  }

  Future<void> deleteWatchlist(String id) async {
    await _service.deleteWatchlist(id);
  }
}