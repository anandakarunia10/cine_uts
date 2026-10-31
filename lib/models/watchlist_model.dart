class WatchlistModel {
  final String? id;
  final String studentId;
  final int movieId;
  final String movieTitle;
  final String? posterPath;
  final double personalRating;
  final String reviewNote;
  final String status;
  final DateTime? createdAt;

  WatchlistModel({
    this.id,
    required this.studentId,
    required this.movieId,
    required this.movieTitle,
    this.posterPath,
    required this.personalRating,
    required this.reviewNote,
    required this.status,
    this.createdAt,
  });

  factory WatchlistModel.fromJson(Map<String, dynamic> json) {
    return WatchlistModel(
      id: json['id']?.toString(),
      studentId: json['student_id'] ?? '',
      movieId: json['movie_id'] ?? 0,
      movieTitle: json['movie_title'] ?? '',
      posterPath: json['poster_path'],
      personalRating: (json['personal_rating'] as num?)?.toDouble() ?? 0.0,
      reviewNote: json['review_note'] ?? '',
      status: json['status'] ?? 'Want to Watch',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'student_id': studentId,
      'movie_id': movieId,
      'movie_title': movieTitle,
      'poster_path': posterPath,
      'personal_rating': personalRating,
      'review_note': reviewNote,
      'status': status,
    };
  }
}