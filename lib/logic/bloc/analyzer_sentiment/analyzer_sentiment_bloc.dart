import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentiment_analysis/data/model/sentiment_response.dart';
import 'package:sentiment_analysis/data/services/sentiment-api-services.dart';

part 'analyzer_sentiment_event.dart';
part 'analyzer_sentiment_state.dart';

class SentimentAnalyzerBloc
    extends Bloc<SentimentAnalyzerEvent, SentimentAnalyzerState> {
  SentimentAnalyzerBloc() : super(const SentimentAnalyzerInitial()) {
    on<AnalyzingText>((event, emit) async {
      emit(const SentimentAnalyzerLoading());

      SentimentApiServices apiServices = SentimentApiServices();
      try {
        var response = await apiServices.analyzeSentiment(event.inputedText);
        final sentimentResponse = SentimentResponse.fromJson(response);
        emit(SentimentAnalyzerSuccess(sentimentResponse: sentimentResponse));
      } catch (e) {
        emit(SentimentAnalyzerError(message: e.toString()));
      }
    });
  }
}
