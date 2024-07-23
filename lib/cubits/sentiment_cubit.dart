import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SentimentCubit extends Cubit<int> {
  SentimentCubit() : super(-1); // -1 represents no sentiment

  void predictSentiment(String text) async {
    try {
      var url = Uri.parse('https://web-production-eff7.up.railway.app/predict');
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'text': text}),
      );

      if (response.statusCode == 200) {
        dynamic data = jsonDecode(response.body);
        if (data is List<dynamic> && data.isNotEmpty) {
          var sentiment = data[0]['Label']; // Extract sentiment from response
          int sentimentIndex;
          switch (sentiment) {
            case 'Negative':
              sentimentIndex = 0;
              break;
            case 'Neutral':
              sentimentIndex = 1;
              break;
            case 'Positive':
              sentimentIndex = 2;
              break;
            default:
              sentimentIndex = -1;
          }
          emit(sentimentIndex);
        } else {
          emit(-1); // No sentiment found
        }
      } else {
        emit(-1); // Error in response
      }
    } catch (e) {
      emit(-1); // Exception occurred
    }
  }
}
