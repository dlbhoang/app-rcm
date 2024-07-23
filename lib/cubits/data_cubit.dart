import 'package:bloc/bloc.dart';
import '../models/data_state.dart';
import '../services/sheets_service.dart';
import '../models/data_analysis.dart';

class DataCubit extends Cubit<DataState> {
  final SheetsService _sheetsService = SheetsService();

  DataCubit() : super(DataInitial());

  Future<void> fetchData() async {
    emit(DataLoading());

    try {
      final sheetsApi = await _sheetsService.getSheetsApi();
      const spreadsheetId = '1o5WLLo0C9ShrgkCHtkKdLOljZQBN6eF7i_i5YtWVvMo';
      const range = 'Data_Analysis!A:R';
      final response = await sheetsApi.spreadsheets.values.get(spreadsheetId, range);

      if (response.values == null || response.values!.isEmpty) {
        emit(DataError('No data found.'));
        return;
      }

      final List<DataAnalysis> data = response.values!
          .skip(1)
          .map((row) => DataAnalysis.fromJson({
            'RestaurantID': row[0],
            'Restaurant Name': row[1],
            'Address': row[2],
            'Time': row[3],
            'District': row[4],
            'Time Open': row[5],
            'Time Close': row[6],
            'Lowest Price': row[7],
            'Highest Price': row[8],
            'UserID': row[9],
            'User': row[10],
            'Review Time': row[11],
            'Rating': row[12],
            'Comment Tokenize': row[13],
            'Positive Count': row[14],
            'Negative Count': row[15],
            'Label': row[16],
          }))
          .toList();

      emit(DataLoaded(data));
    } catch (e) {
      emit(DataError(e.toString()));
    }
  }
}
