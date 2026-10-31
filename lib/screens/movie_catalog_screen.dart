import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../widgets/movie_card.dart';
import '../widgets/responsive_layout.dart';
import 'movie_detail_screen.dart';

class MovieCatalogScreen extends StatefulWidget {
  const MovieCatalogScreen({super.key});

  @override
  State<MovieCatalogScreen> createState() => _MovieCatalogScreenState();
}

class _MovieCatalogScreenState extends State<MovieCatalogScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog & Pencarian Film'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari judul film...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    Provider.of<MovieProvider>(context, listen: false)
                        .searchMovies('');
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: const Color(0xFF1E293B),
              ),
              onSubmitted: (query) {
                Provider.of<MovieProvider>(context, listen: false)
                    .searchMovies(query);
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Consumer<MovieProvider>(
                builder: (context, provider, child) {
                  if (provider.state == ApiState.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (provider.searchResults.isEmpty &&
                      _searchController.text.isNotEmpty) {
                    return const Center(
                      child: Text('Film yang Anda cari tidak ditemukan.'),
                    );
                  }

                  if (provider.searchResults.isEmpty) {
                    return const Center(
                      child: Text('Ketik judul film di atas untuk mencari.'),
                    );
                  }

                  return ResponsiveLayout(
                    compactBody: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: provider.searchResults.length,
                      itemBuilder: (context, index) {
                        final movie = provider.searchResults[index];
                        return MovieCard(
                          movie: movie,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MovieDetailScreen(movie: movie),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    wideBody: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: provider.searchResults.length,
                      itemBuilder: (context, index) {
                        final movie = provider.searchResults[index];
                        return MovieCard(
                          movie: movie,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => MovieDetailScreen(movie: movie),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}