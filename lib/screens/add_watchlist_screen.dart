import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../models/movie_model.dart';
import '../models/watchlist_model.dart';
import '../providers/watchlist_provider.dart';

class AddWatchlistScreen extends StatefulWidget {
  final MovieModel movie;

  const AddWatchlistScreen({super.key, required this.movie});

  @override
  State<AddWatchlistScreen> createState() => _AddWatchlistScreenState();
}

class _AddWatchlistScreenState extends State<AddWatchlistScreen> {
  final _formKey = GlobalKey<FormState>();
  final _noteController = TextEditingController();
  
  double _personalRating = 8.0;
  String _selectedStatus = 'Want to Watch';
  bool _isSubmitting = false;

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    final provider = Provider.of<WatchlistProvider>(context, listen: false);
    final newItem = WatchlistModel(
      studentId: provider.studentId,
      movieId: widget.movie.id,
      movieTitle: widget.movie.title,
      posterPath: widget.movie.posterPath,
      personalRating: _personalRating,
      reviewNote: _noteController.text.trim(),
      status: _selectedStatus,
    );

    final success = await provider.addWatchlist(newItem);

    setState(() => _isSubmitting = false);

    if (mounted) {
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Berhasil menambahkan film ke watchlist!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal menyimpan: ${provider.errorMessage}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simpan: ${widget.movie.title}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.movie.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text('Status Tontonan:'),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                initialValue: _selectedStatus,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Want to Watch',
                    child: Text('Want to Watch'),
                  ),
                  DropdownMenuItem(
                    value: 'Watched',
                    child: Text('Watched'),
                  ),
                ],
                onChanged: (val) {
                  if (val != null) setState(() => _selectedStatus = val);
                },
              ),
              const SizedBox(height: 16),
              const Text('Rating Pribadi:'),
              const SizedBox(height: 8),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: _personalRating / 2,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        _personalRating = rating * 2;
                      });
                    },
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '${_personalRating.toStringAsFixed(1)} / 10.0',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Catatan / Review Singkat:'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _noteController,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Tulis kesan atau alasan ingin menonton...',
                  border: OutlineInputBorder(),
                  filled: true,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Catatan ulasan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submitForm,
                  child: _isSubmitting
                      ? const CircularProgressIndicator()
                      : const Text('Simpan ke Database'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}