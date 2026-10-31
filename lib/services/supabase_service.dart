import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/watchlist_model.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;

  // READ Watchlist
  Future<List<WatchlistModel>> getWatchlist(String studentId) async {
    final response = await _client
        .from('user_watchlist')
        .select()
        .eq('student_id', studentId)
        .order('created_at', ascending: false);

    return (response as List)
        .map((json) => WatchlistModel.fromJson(json))
        .toList();
  }

  // CREATE Watchlist
  Future<void> addWatchlist(WatchlistModel item) async {
    await _client.from('user_watchlist').insert(item.toJson());
  }

  // UPDATE Watchlist
  Future<void> updateWatchlist(String id, double rating, String note, String status) async {
    await _client.from('user_watchlist').update({
      'personal_rating': rating,
      'review_note': note,
      'status': status,
    }).eq('id', id);
  }

  // DELETE Watchlist
  Future<void> deleteWatchlist(String id) async {
    await _client.from('user_watchlist').delete().eq('id', id);
  }
}