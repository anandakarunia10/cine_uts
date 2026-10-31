import 'package:flutter/material.dart';

class MovieCatalogScreen extends StatelessWidget {
  const MovieCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Catalog')),
      body: const Center(child: Text('Catalog & Search Screen')),
    );
  }
}