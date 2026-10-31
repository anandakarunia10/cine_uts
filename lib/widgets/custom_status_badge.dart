import 'package:flutter/material.dart';

class CustomStatusBadge extends StatelessWidget {
  final String status;

  const CustomStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final isWatched = status == 'Watched';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isWatched
            ? Colors.green.withValues(alpha: 0.2)
            : Colors.amber.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isWatched ? Colors.green : Colors.amber,
          width: 1,
        ),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isWatched ? Colors.greenAccent : Colors.amberAccent,
        ),
      ),
    );
  }
}