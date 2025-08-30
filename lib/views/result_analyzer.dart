import 'package:flutter/material.dart';
import 'package:sentiment_analysis/data/model/sentiment_response.dart';

class ResultAnalyzer extends StatelessWidget {
  final SentimentResponse result;
  final VoidCallback? onBackClicked;

  const ResultAnalyzer(
      {super.key, required this.result, required this.onBackClicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        result.status == 'COMPLETED'
                            ? Icons.check_circle_outline
                            : Icons.error_outline,
                        color: result.status == 'COMPLETED'
                            ? Colors.green
                            : Colors.red,
                        size: 48,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Analysis Result",
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Status: ${result.status}",
                        style: TextStyle(
                          color: result.status == 'COMPLETED'
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // const Text("Model:",
                      //     style: TextStyle(fontWeight: FontWeight.w500)),
                      // const SizedBox(height: 16),
                      // Text(result.output.model,
                      //     style: const TextStyle(fontFamily: 'RobotoMono')),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Inference Time:",
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          Text(result.output.inferenceTime,
                              style: const TextStyle(fontFamily: 'RobotoMono')),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Texts Processed:",
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          Text("${result.output.textsProcessed}",
                              style: const TextStyle(fontFamily: 'RobotoMono')),
                        ],
                      ),
                      const Divider(height: 32, thickness: 1.2),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sentiment Scores:",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...result.output.results.map((res) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                res.label,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: _getColorForLabel(res.label),
                                ),
                              ),
                              Text(
                                (res.sPercentage.toString()),
                                style: const TextStyle(
                                  fontFamily: 'RobotoMono',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onBackClicked,
                icon: const Icon(Icons.restore_page, size: 20),
                label: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Reset",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Color _getColorForLabel(String label) {
    switch (label) {
      case 'Very Negative':
        return Colors.red.shade700;
      case 'Negative':
        return Colors.red.shade400;
      case 'Neutral':
        return Colors.grey;
      case 'Positive':
        return Colors.lightGreen;
      case 'Very Positive':
        return Colors.green.shade700;
      default:
        return Colors.blueGrey;
    }
  }
}
