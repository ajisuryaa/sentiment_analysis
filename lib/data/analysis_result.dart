class Result {
  final String label;
  final double score;

  Result({required this.label, required this.score});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      label: json['label'] ?? '',
      score: (json['score'] as num).toDouble(),
    );
  }
}
