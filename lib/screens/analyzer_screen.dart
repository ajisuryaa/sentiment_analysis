import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentiment_analysis/logic/bloc/analyzer_sentiment/analyzer_sentiment_bloc.dart';
import 'package:sentiment_analysis/logic/cubit/count_text_cubit.dart';
import 'package:sentiment_analysis/views/form_input.dart';
import 'package:sentiment_analysis/views/result_analyzer.dart';

class AnalyzerScreen extends StatefulWidget {
  const AnalyzerScreen({super.key});

  @override
  State<AnalyzerScreen> createState() => _FormInputState();
}

class _FormInputState extends State<AnalyzerScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => TextLengthCubit(),
            ),
            BlocProvider(
              create: (context) => SentimentAnalyzerBloc(),
            ),
          ],
          child: BlocBuilder<SentimentAnalyzerBloc, SentimentAnalyzerState>(
            builder: (context, state) {
              if (state is SentimentAnalyzerInitial) {
                return FormInput(
                  textController: _controller,
                );
              } else if (state is SentimentAnalyzerSuccess) {
                return ResultAnalyzer(
                  result: state.sentimentResponse,
                  onBackClicked: () {
                    context
                        .read<SentimentAnalyzerBloc>()
                        .add(const ResetAnalyzing());
                  },
                );
              } else if (state is SentimentAnalyzerLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SentimentAnalyzerError) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return const Center(
                  child: Text("Something error"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
