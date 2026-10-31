import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class AddWatchlistScreen extends StatelessWidget {
  final MovieModel movie;

  const AddWatchlistScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Watchlist: ${movie.title}'),
      ),
      body: const Center(
        child: Text('Form Tambah Watchlist (Akan disambungkan ke Supabase)'),
      ),
    );
  }
}