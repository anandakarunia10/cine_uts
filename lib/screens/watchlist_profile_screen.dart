import 'package:flutter/material.dart';

class WatchlistProfileScreen extends StatelessWidget {
  const WatchlistProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Watchlist & Profile')),
      body: const Center(child: Text('Watchlist (Supabase DB) & Profile Info')),
    );
  }
}