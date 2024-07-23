import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/sentiment_cubit.dart';
class SentimentScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  SentimentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Enter Text for Sentiment Analysis',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Enter your text...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      prefixIcon: Icon(Icons.text_fields, color: Colors.blue[800]),
                      contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                    ),
                    maxLines: 4,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<SentimentCubit>(context).predictSentiment(_textEditingController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
                ),
                child: const Text(
                  'Predict Sentiment',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24),
              BlocBuilder<SentimentCubit, int>(
                builder: (context, sentimentIndex) {
                  IconData icon;
                  String label;

                  switch (sentimentIndex) {
                    case 0:
                      icon = Icons.sentiment_very_dissatisfied;
                      label = 'Negative';
                      break;
                    case 1:
                      icon = Icons.sentiment_neutral;
                      label = 'Neutral';
                      break;
                    case 2:
                      icon = Icons.sentiment_very_satisfied;
                      label = 'Positive';
                      break;
                    default:
                      icon = Icons.help;
                      label = 'No result';
                  }

                  return Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(icon, size: 50, color: Colors.blue[800]),
                          const SizedBox(width: 16.0),
                          Text(
                            label,
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
