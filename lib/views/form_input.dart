import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentiment_analysis/logic/bloc/analyzer_sentiment/analyzer_sentiment_bloc.dart';
import 'package:sentiment_analysis/logic/cubit/count_text_cubit.dart';
import 'package:sentiment_analysis/utils/color_pickers.dart';

class FormInput extends StatelessWidget {
  const FormInput({super.key, required this.textController});
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<TextLengthCubit, int>(
            builder: (context, state) {
              return TextField(
                controller: textController,
                maxLines: null,
                minLines: 5,
                maxLength: 300,
                onChanged: (value) {
                  context.read<TextLengthCubit>().updateText(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan pesan Anda',
                  hintText: 'Tulis pesan (maksimal 300 karakter)...',
                  alignLabelWithHint: true,
                ),
                keyboardType: TextInputType.multiline,
              );
            },
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                ),
              ),
              BlocBuilder<TextLengthCubit, int>(
                builder: (context, state) {
                  if (state > 0) {
                    return ElevatedButton.icon(
                      onPressed: () {
                        context.read<SentimentAnalyzerBloc>().add(
                            AnalyzingText(inputedText: textController.text));
                      },
                      icon: const Icon(Icons.analytics, color: Colors.white),
                      label: const Text(
                        'Start Analyze',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 0.5,
                          color: Colors.white,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPickers.buttonColor,
                        foregroundColor: Colors.white,
                        elevation: 6,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        shadowColor: ColorPickers.shadowButton,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
