class Result {
  final String label;
  final double percentage; // Now represents percentage (0-100)
  final String sPercentage;

  Result(
      {required this.label,
      required this.percentage,
      required this.sPercentage});

  factory Result.fromJson(Map<String, dynamic> json) {
    // Assume the API returns a score between 0 and 1, convert to percentage
    double rawScore = (json['score'] as num).toDouble();
    return Result(
        label: json['label'] ?? '',
        percentage: rawScore * 100,
        sPercentage: formatPercentage(rawScore * 100));
  }

  /// Formats a double value as a percentage string with two decimal places, e.g., 98.05%
  static String formatPercentage(double value) {
    return "${value.toStringAsFixed(2)}%";
  }
}
